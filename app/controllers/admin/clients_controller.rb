class Admin::ClientsController < AdminsController

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

  private
  def client_params
    params.require(:client).permit(:name, :address, :phone_number, :city, :state, :zipcode)
  end
end