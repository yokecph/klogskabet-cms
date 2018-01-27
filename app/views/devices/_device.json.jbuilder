json.extract! device, :id, :name, :kind, :last_contact, :passcode, :eth_ip, :wlan_ip, :created_at, :updated_at
json.url device_url(device, format: :json)
