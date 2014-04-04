require 'digest/sha1'

class UcloudApiClient
  class << self
    attr_accessor :public_key, :private_key, :base_url
    def configure
      yield self
    end
  end
  def initialize()
    #@base = "https://api.ucloud.cn"
    #@private_key = "a898f7620bb12f8af80dd32c17cdec2e2111993b"
  end
  def get(url, params, format="json")
    params = params.clone
    params["region_id"] = 1
    params["zone_id"] = 1
    params["project_id"] = 1
    params["module_id"] = 1

    params["access_token"] = verify_ac(params)
    result = RestClient.get "#{UcloudApiClient.base_url}#{url}", {:params => params.merge("format"=>format)}
    puts result
    result
  end

  def post

  end

  private
    def verify_ac(params)
      params = params.clone

      params_data = ""
      params.sort.each do |key, value|
        params_data = params_data + key.to_s + value.to_s

        params_data = params_data + UcloudApiClient.private_key

        #'''use sha1 to encode keys'''

      end
      Digest::SHA1.hexdigest params_data
    end

end