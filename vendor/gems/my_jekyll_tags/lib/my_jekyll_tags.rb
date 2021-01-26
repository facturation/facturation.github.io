require "my_jekyll_tags/version"

module Jekyll
  class CurlTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      def curl_cmd(write: false, user_agent_key: "User-Agent")
        res = "curl -i -S -u login:password -H '#{user_agent_key}: MonApp (patrick@camping.test)' \\\n"
        write ? "#{res} -H 'Content-Type: application/json; charset=utf-8' \\\n" : res
      end
    end
  end
end

Liquid::Template.register_tag("curl_cmd", Jekyll::CurlTag)
