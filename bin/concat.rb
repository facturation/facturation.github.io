#!/usr/bin/env ruby

require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "front_matter_parser"
end

require "pathname"

# Chemin vers le répertoire api
BASE_DIR = Pathname.new(File.join(__dir__, ".."))

def process_content(content)
  content.strip.gsub(/^#/im, "##") + "\n\n"
end

def process_directory(dir)
  content = ""

  # Collecter tous les fichiers avec leur front matter
  parent = nil
  files_with_metadata = Dir.glob(File.join(dir, "*.md")).map do |file|
    next if file.include?("index.md") # Ignore les fichiers index
    begin
      parsed = FrontMatterParser::Parser.parse_file(file)
      parent ||= parsed.front_matter["parent"]
      {
        path: file,
        nav_order: parsed.front_matter["nav_order"] || Float::INFINITY,
        content: parsed.content,
        title: parsed.front_matter["title"],
      }
    rescue => e
      puts "Erreur lors de la lecture de #{file}: #{e.message}"
      nil
    end
  end.compact

  # Trier les fichiers par nav_order
  content << "# #{parent}\n\n" if parent
  files_with_metadata.sort_by { |f| f[:nav_order] }.each do |file|
    content << "## #{file[:title]}\n\n" if file[:title]
    content << process_content(file[:content])
  end

  content
end

def process_file(file)
  parsed = FrontMatterParser::Parser.parse_file(file)
  process_content(parsed.content)
end

# Parcourir les sous-répertoires du dossier api
pages = []
pages << process_file(File.join(BASE_DIR, "index.md"))

Dir.glob(File.join(BASE_DIR, "api/*")).select { |f| File.directory?(f) }.each do |subdir|
  dirname = File.basename(subdir)
  content = process_directory(subdir)
  puts "Processed #{dirname}: #{content.length} characters"
  pages.push(content)
end
pages.push(process_directory(File.join(BASE_DIR, "values")))
pages.push(process_directory(File.join(BASE_DIR, "liquid")))
pages << process_file(File.join(BASE_DIR, "outils.md"))

File.open("all.md", "w") do |f|
  f.write("---\nlayout: default\ntitle: Documentation 1-page\n---\n\n")
  f.write(pages.join("\n\n"))
end
