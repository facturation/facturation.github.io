module MyJekyllTags
  module UrlForFilter
    def api_url(input)
      host = Jekyll.env == "production" ? "https://facturation.pro" : "https://facturation.test"
      "#{host}#{input}"
    end
  end

  class CurlTag < Liquid::Tag
    def initialize(tag_name, params, tokens)
      super
      @params = eval("{#{params}}")
    rescue SyntaxError
      @params = {}
    end

    # curl_cmd write: true, user_agent: 'toto'
    def render(context)
      res = "curl -i -S -u login:password -H '#{user_agent}: MonApp (patrick@camping.test)' \\\n"
      write_mode? ? "#{res} -H 'Content-Type: application/json; charset=utf-8' \\\n" : res
    end

    private

    def write_mode?
      !!@params[:write]
    end

    def user_agent
      @params[:user_agent] || "User-Agent"
    end
  end

  class ApiBlock < Liquid::Block
    def initialize(tag_name, style, tokens)
      super
      @style = eval(style)
      @style = "sh" if @style.to_s.strip == ""
    end

    def render(context)
      text = super
      "```#{@style}\n#{text.strip}\n```"
    end
  end
end

Liquid::Template.register_filter(MyJekyllTags::UrlForFilter)

Liquid::Template.register_tag("curl_cmd", MyJekyllTags::CurlTag)
Liquid::Template.register_tag("api_block", MyJekyllTags::ApiBlock)
