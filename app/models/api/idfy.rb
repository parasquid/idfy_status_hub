module Api
  class Idfy
    include HTTParty
    debug_output $stdout if Rails.env.development?
    base_uri 'https://idfy.0x10.info/api'

    def initialize(type: 'json')
      @type = type
      @options = { type: @type }
    end

    def list_member(page: 1)
      params = @options.merge({page: page, query: 'list_member'})
      result = self.class.get("/idfy-status", query: params)
      result.to_hash
    end

    def api_hits
    end
  end
end