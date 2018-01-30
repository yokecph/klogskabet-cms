FactoryBot.define do
  factory :device do
    sequence(:name) { |n| "test-device-#{n}" }
    kind Device::KINDS.sample
    last_contact "2018-01-27 12:00:00"
    eth_ip "10.0.0.10"
    wlan_ip "192.168.0.10"
  end
end
