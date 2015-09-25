require 'rails_helper'

describe ApprovalsController do
  let(:client)   { Fabricate(:client) }
  let(:client_2) { Fabricate(:client) }
  let(:user)     { Fabricate(:user, client_id: client.id) }
  let(:user_2)   { Fabricate(:user, client_id: client_2.id) }
  let(:asset)    { Fabricate(:asset, client_id: client.id) }
  let(:asset_2)  { Fabricate(:asset, client_id: client_2.id) }
  let(:priority) { Fabricate(:priority) }

  describe 'GET index' do
    context 'authenticated users' do
      before do
        sign_in user
        get :index, asset_id: asset.id
      end

      it 'has a successful response' do
        expect(response).to be_success
      end

      it 'renders the index template' do
        expect(response).to render_template :index
      end

      it 'sets the @approvals variable' do
        approval = Fabricate(:approval, asset_id: asset.id, priority_id: priority.id)
        expect(assigns(:approvals)).to eq([approval])
      end

      it 'sets the @approved variable' do
        approved = Fabricate(:approval, asset_id: asset.id, priority_id: priority.id, approved: true)
        expect(assigns(:approved)).to eq([approved])
      end
    end

    context 'unauthenticated users' do
      it 'should redirect the user to the root path' do
        get :index, asset_id: asset.id
        expect(response).to redirect_to root_path
      end
    end

    context 'for incorrect signed in users' do
      before do
        sign_in user
      end

      it 'should redirect a user not associated with the asset' do
        get :index, asset_id: asset_2.id
        expect(response).to redirect_to assets_path
      end
    end
  end

  describe 'PUT update' do
    let(:approval) { Fabricate(:approval, asset_id: asset.id, priority_id: priority.id, approved: false) }

    context 'authenticated users' do
      before do
        sign_in user
      end

      context 'with valid inputs' do
        before do
          post :update, {
            asset_id: asset.id,
            id: approval.id,
            approval: Fabricate.attributes_for(:approval, approved: true)
          }
        end

        it 'updates the approval to true' do
          approval.reload
          expect(approval.approved).to eq(true)
        end

        it 'should redirect to the approvals page' do
          expect(response).to redirect_to asset_approvals_path
        end
      end
    end
  end
end









































