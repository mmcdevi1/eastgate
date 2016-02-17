require 'rails_helper'

describe AssetsController do
  let(:client_1)     { Fabricate(:client, id: 1) }
  let(:client_2)     { Fabricate(:client, id: 2) }
  let(:broker_user)  { Fabricate(:user) }
  let(:admin)        { Fabricate(:user, admin: true) }
  let(:john)         { Fabricate(:user, client_id: 1) }
  let(:asset_1)      { Fabricate(:asset, id: 1, client_id: 1) }
  let(:asset_2)      { Fabricate(:asset, id: 2, client_id: 2) }
  let(:asset_3)      { Fabricate(:asset, id: 3, client_id: 3) }

  describe 'GET #index' do
    context 'authenticated admins' do
      before do
        sign_in admin
        get :index
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'sets @assets to Asset.all' do
        expect(assigns(:assets)).to eq([asset_1, asset_2, asset_3])
      end
    end

    context 'authenticated client users' do
      before do
        client_1
        sign_in john
        get :index
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'sets @assets to current_user.assets' do
        expect(assigns(:assets)).to eq([asset_1])
      end
    end

    context 'authenticated brokers' do
      before do
        Broker.create(user_id: broker_user.id, asset_id: 1)
        sign_in broker_user
        get :index
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'sets @assets to current_user.assets' do
        expect(assigns(:assets)).to eq([asset_1])
      end

      it 'expects asset_1 to have a broker' do
        expect(asset_1.has_broker?(broker_user)).to eq(true)
      end

      it 'expects asset_2 to not have broker' do
        expect(asset_2.has_broker?(broker_user)).to eq(false)
      end

      it 'expects asset_3 to not have broker' do
        expect(asset_3.has_broker?(broker_user)).to eq(false)
      end
    end

    context 'unauthenticate users' do
      before do
        get :index
      end

      it "redirects to the login page" do
        expect(response).to redirect_to root_path
      end

      it 'displays a flash error message' do
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe 'GET #show' do
    context 'authenticated admin' do
      before do
        sign_in admin
      end

      it 'returns http success for asset_1' do
        get :show, id: asset_1.id
        expect(response).to have_http_status(:success)
      end

      it 'returns http success for asset_2' do
        get :show, id: asset_2.id
        expect(response).to have_http_status(:success)
      end

      it 'returns http success for asset_3' do
        get :show, id: asset_3.id
        expect(response).to have_http_status(:success)
      end
    end

    context 'authenticated client users' do
      before do
        client_1
        sign_in john
      end

      it 'returns http success for asset_1' do
        get :show, id: asset_1.id
        expect(response).to have_http_status(:success)
      end

      it 'returns http redirect for asset_2' do
        get :show, id: asset_2.id
        expect(response).to have_http_status(:redirect)
      end

      it 'returns http redirect for asset_3' do
        get :show, id: asset_3.id
        expect(response).to have_http_status(:redirect)
      end

      it 'redirects the client user if user tries to access a different asset that belongs to another client' do
        get :show, id: asset_2.id
        expect(response).to redirect_to assets_path
      end

      it 'redirects the client user if user tries to access a different asset that belongs to another client' do
        get :show, id: asset_3.id
        expect(response).to redirect_to assets_path
      end
    end

    context 'authenticated brokers' do
      before do
        Broker.create(user_id: broker_user.id, asset_id: 1)
        Broker.create(user_id: broker_user.id, asset_id: 2)
        sign_in broker_user
      end

      it 'returns http success for asset_1' do
        get :show, id: asset_1.id
        expect(response).to have_http_status(:success)
      end

      it 'returns http success for asset_2' do
        get :show, id: asset_2.id
        expect(response).to have_http_status(:success)
      end

      it 'returns http redirect for asset_3' do
        get :show, id: asset_3.id
        expect(response).to have_http_status(:redirect)
      end

      it 'redirects the client user if user tries to access a different asset that belongs to another client' do
        get :show, id: asset_3.id
        expect(response).to redirect_to assets_path
      end
    end
  end

end








































