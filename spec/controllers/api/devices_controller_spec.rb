require 'rails_helper'

RSpec.describe Api::DevicesController, type: :controller do

  describe "GET #show" do
    it "returns http success for existing devices with content" do
      device = create :device, kind: :screen
      device.update_attribute(:content, create(:quiz, :with_options))
      get :show, params: { id: device.name }, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns http not found non-existing devices" do
      get :show, params: { id: 'foobar' }, format: :json
      expect(response).to have_http_status(:not_found)
    end

    it "updates the device's last_contact" do
      device = create :device, last_contact: 2.days.ago
      was = device.last_contact
      get :show, params: { id: device.name }, format: :json
      device.reload
      expect(device.last_contact).to_not eq was
    end
  end

  describe "PUT #update" do
    let(:device) { create :device }

    it "updates the device's last_contact" do
      device = create :device, last_contact: 2.days.ago
      was = device.last_contact
      put :update, params: { id: device.name, device: { eth_ip: "ethernet" } }, format: :json
      device.reload
      expect(device.last_contact).to_not eq was
    end

    it "updates the device's meta info with the provided data" do
      device = create :device
      put :update, params: { id: device.name, device: { eth_ip: "ethernet", wlan_ip: "wlan" } }, format: :json
      device.reload
      expect(device.eth_ip).to eq "ethernet"
      expect(device.wlan_ip).to eq "wlan"
    end

    it "skips updating blank params" do
      device = create :device
      was = device.eth_ip
      put :update, params: { id: device.name, device: { eth_ip: "", wlan_ip: "wlan" } }, format: :json
      device.reload
      expect(device.eth_ip).to eq was
      expect(device.wlan_ip).to eq "wlan"
    end

  end

end
