class Api::DevicesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :load_device

  def show
    @content = @device.content
    if @content.present?
      unless @content.presentable?
        render status: :not_found, json: { error: "No usable content assigned" }
      end
    else
      render status: :not_found, json: { error: "No content assigned" }
    end
  end

  def update
    attrs = device_params.select { |attr, value| value.present? }.to_h
    @device.update_attributes(attrs)
    head :ok
  end

  private

  def load_device
    @device = Device.find_by_name(params[:id])
    if @device.present?
      @device.touch(:last_contact)
    else
      render status: :not_found, json: { error: "Unregistered device" }
    end
  end

  def device_params
    params.require(:device).permit(:eth_ip, :wlan_ip)
  end
end
