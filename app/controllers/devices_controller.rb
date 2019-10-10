# frozen_string_literal: true

class DevicesController < ApplicationController
  before_action :find_device, only: %i[show destroy edit update]

  def index
    @devices = Device.all
  end

  def show; end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      flash[:notice] = 'Device criado com sucesso!'
      redirect_to @device
    else
      flash[:error] = 'Confira os dados e tente novamente.'
      redirect_to new_device_path
    end
  end

  def destroy
    file = Rails.root.join('grafana', 'dashboards', "#{@device.mac}.json")
    if @device.destroy
      if system("rm #{file}")
        flash[:notice] = 'Device apagado com sucesso!'
      else
        flash[:error] = 'Erro ao apagar dashboard.'
      end
    else
      flash[:error] = 'Erro ao apagar device, tente novamente.'
    end
    redirect_to root_path
  end

  def edit; end

  def update
    if update_dashboard && @device.update(device_params)
      redirect_to @device
    else
      render 'edit'
    end
  end

  private

  def find_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:name, :mac, :cel)
  end

  def update_dashboard
    Grafana.update(@device.mac, device_params[:mac])
  end
end
