module Jekyll
  class RawContent < Generator
    # store the raw markdown content of each page in a raw_content property
    # this is useful to build markdown content but still process the liquid tags
    def generate(site)
      # create a template object
      site.pages.each do |entry|
        entry.data["raw_content"] = render_liquid(site, entry)
      end

      # site.posts.each do |entry|
      #   entry.data["raw_content"] = render_liquid(site, entry)
      # end

      # site.collections.each do |collection|
      #   collection.each do |label, docs|
      #     if label.is_a?(Jekyll::Document)
      #       docs = [label]
      #     end
      #     docs.each do |entry|
      #       entry.data["raw_content"] = render_liquid(site, entry)
      #     end if !docs.nil?
      #   end
      # end
    end

    def render_liquid(site, entry)
      # the render method expects this information
      liquid_options = site.config["liquid"]
      info = {
        :registers => { :site => site, :page => entry.relative_path },
        :strict_filters => liquid_options["strict_filters"],
        :strict_variables => liquid_options["strict_variables"],
      }
      template = site.liquid_renderer.file(entry.relative_path).parse(entry.content.dup)
      template.render!(site.site_payload, info)
    end
  end
end

# Jekyll::Hooks.register :documents, :pre_render do |doc, payload|
#   # make some local variables for convenience
#   site = doc.site
#   liquid_options = site.config["liquid"]
#   # create a template object
#   template = site.liquid_renderer.file(doc.path).parse(doc.content)
#   # the render method expects this information
#   info = {
#     :registers => { :site => site, :page => payload["page"] },
#     :strict_filters => liquid_options["strict_filters"],
#     :strict_variables => liquid_options["strict_variables"],
#   }
#   # render the content into a new property
#   doc.data["rendered_content"] = template.render!(payload, info)
# end
