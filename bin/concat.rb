#!/usr/bin/env ruby

require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "front_matter_parser"
end

require "pathname"

# Chemin vers le répertoire api
BASE_DIR = Pathname.new(File.join(__dir__, ".."))

def process_content(content, tabulate = true)
  if tabulate
    content.strip.gsub(/^#/im, "##") + "\n\n"
  else
    content.strip + "\n\n"
  end
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

def process_file(file, clean_content = false)
  parsed = FrontMatterParser::Parser.parse_file(file)
  content = parsed.content.to_s
  if clean_content
    content.gsub!("{:toc}", "")
    content.gsub!(/([^\n]+TOC\s+)/im, "")
    # content.gsub!(/([^\n]+TOC\s+)/im, llm_help)
  end
  process_content(parsed.content, !clean_content)
end

# Parcourir les sous-répertoires du dossier api
pages = []
pages << process_file(File.join(BASE_DIR, "_llm_intro.md"), true)

Dir.glob(File.join(BASE_DIR, "api/*")).select { |f| File.directory?(f) }.each do |subdir|
  dirname = File.basename(subdir)
  content = process_directory(subdir)
  puts "Processed #{dirname}: #{content.length} characters"
  pages.push(content)
end
pages.push(process_directory(File.join(BASE_DIR, "values")))
pages << process_file(File.join(BASE_DIR, "_llm_conclude.md"), true)

# pages.push(process_directory(File.join(BASE_DIR, "liquid")))
# pages << process_file(File.join(BASE_DIR, "outils.md"))

llm_file = File.join(BASE_DIR, "_includes/llm.md")
File.delete(llm_file) if File.exist?(llm_file)
File.open(llm_file, "w") do |f|
  f.write(pages.join("\n\n"))
end
