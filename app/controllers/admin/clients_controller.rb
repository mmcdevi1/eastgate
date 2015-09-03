class Admin::ClientsController < AdminsController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:success] = "New client created."
      redirect_to admin_clients_path
    else
      render 'new'
    end
  end

  def destroy
    @client.destroy
    flash[:success] = 'Client has been deleted.'
    redirect_to :back
  end

  private
  def client_params
    params.require(:client).permit(:name, :address, :phone_number, :city, :state, :zipcode)
  end

  def set_client
    @client = Client.find(params[:id])
  end
end