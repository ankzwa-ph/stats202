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
      res = '?apiKey=%s&projectId[]=1073827573&' % ENV['BACKLOG_API_KEY']
      res += params.map { |x| x.join('=') }.join('&')
    end

  module ClassMethod
  end
end
