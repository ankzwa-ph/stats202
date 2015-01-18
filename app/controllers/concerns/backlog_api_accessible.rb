module BacklogApiAccessible
  extend ActiveSupport::Concern

  included do
    def fetch(path, params = {})
      url = Settings.backlog.base_url
      url += path + url_generate(params)
      HTTParty.get(url)
    end
  end

  private
    def url_generate(params)
      api_key = '?apiKey=%s' % ENV['BACKLOG_API_KEY']
      return params.to_s + api_key if params.is_a? Fixnum
      res = api_key + '&projectId[]=%s&' % Settings.backlog.project_id
      res += params.map { |x| x.join('=') }.join('&')
    end

  module ClassMethod
  end
end
