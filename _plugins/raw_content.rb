module Jekyll
  class RawContent < Generator
    def generate(site)
      site.posts.each do |entry|
        entry.data["raw_content"] = entry.content.dup
      end
      site.pages.each do |entry|
        entry.data["raw_content"] = entry.content.dup
      end
      # site.collections.each do |collection|
      #   collection.each do |label, docs|
      #     if label.is_a?(Jekyll::Document)
      #       docs = [label]
      #     end
      #     docs.each do |entry|
      #       entry.data["raw_content"] = entry.content.dup
      #     end if !docs.nil?
      #   end
      # end
    end
  end
end
