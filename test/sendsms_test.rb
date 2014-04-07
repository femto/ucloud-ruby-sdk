require_relative './test_helper'
class SendsmsTest < Test::Unit::TestCase
  def test_send_sms
    params = {}
    UcloudApiClient.configure do |config|
      config.public_key = ENV["PUBLIC_KEY"]
      config.private_key = ENV["PRIVATE_KEY"]
      config.base_url = ENV["BASE_URL"]
    end

    UcloudApiClient.new.get("/ufirewall", params,"xml")
  end
end