require_relative './test_helper'
require 'json'
class SendsmsTest < Test::Unit::TestCase
  def test_send_sms
    params = {}
    UcloudApiClient.configure do |config|
      config.public_key = ENV["PUBLIC_KEY"]
      config.private_key = ENV["PRIVATE_KEY"]
      config.base_url = ENV["BASE_URL"]
    end

    puts UcloudApiClient.new.get("/ufirewall", params,"json")
  end

  def test_send_sms1
    params = {"phone"=>"\"18101904215\"","content"=>"hi"}
    UcloudApiClient.configure do |config|
      config.public_key = ENV["PUBLIC_KEY"]
      config.private_key = ENV["PRIVATE_KEY"]
      config.base_url = ENV["BASE_URL"]
    end

    puts UcloudApiClient.new.post("/monitor/sendsms", params,"json")
  end

  def test_add_firewall

    UcloudApiClient.configure do |config|
      config.public_key = ENV["PUBLIC_KEY"]
      config.private_key = ENV["PRIVATE_KEY"]
      config.base_url = ENV["BASE_URL"]
    end
    params = {}

    params['rule_set'] = JSON.generate(
        [
                {"src_ip" => "192.168.8.1",
    "dst_port" => 80,
    "proto_type" => 1,
    "action" =>  "accept"}

    ])
    params["group_name"] = "first"

    params['format']               = "json";

    puts UcloudApiClient.new.post("/ufirewall", params,"json")
  end
end