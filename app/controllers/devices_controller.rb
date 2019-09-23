class DevicesController < ApplicationController
  before_action :find_device, only: [:show, :destroy]

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
    if @device.destroy
      flash[:notice] = 'Device apagado com sucesso!'
    else
      flash[:error] = 'Erro ao apagar, tente novamente.'
    end
    redirect_to root_path
  end

  private

  def find_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:name, :mac, :cel)
  end
end
