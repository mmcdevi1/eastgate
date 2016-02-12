module Admin
  class ClientsController < AdminsController
    before_action :set_client, only: [:show, :edit, :update, :destroy]

    def index
      @clients = Client.all
    end

    def show
    end

    def edit
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

    def update
      if @client.update(client_params)
        flash[:success] = 'Client updated.'
        redirect_to edit_admin_client_path(@client)
      else
        render 'edit'
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
end