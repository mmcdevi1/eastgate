class Admin::AssetsController < AdminsController

  def index
    @clients = Client.all
    @assets = Asset.all
  end

end