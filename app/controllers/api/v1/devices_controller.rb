# frozen_string_literal: true

class Api::V1::DevicesController < ActionController::API
  before_action :find_device, only: [:search, :alert]

  def search
    if @device.blank?
      render json: 'not_found', status: :not_found
    else
      render json: { name: @device.name, cel: @device.cel }, status: :ok
    end
  end

  def alert
    if @device.blank?
      return render json: 'not_found', status: :not_found
    end
    if @device.send_alert
      render json: {}, status: :ok
    else
      render json: {}, status: :service_unavailable
    end
  end

  private

  def find_device
    @device = Device.find_by(mac: params[:mac])
    @device ||= Device.find_by(mac: params['message'])
  end
end
