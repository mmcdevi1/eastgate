require 'rails_helper'

describe ApprovalsController do
  let(:client)   { Fabricate(:client) }
  let(:user)     { Fabricate(:user, client_id: client.id) }
  let(:asset)    { Fabricate(:asset, client_id: client.id) }
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
  end

  describe 'POST update' do
    let(:approval) { Fabricate(:approval, asset_id: asset.id, priority_id: priority.id) }

    context 'authenticated users' do
      before do
        sign_in user
      end

      context 'with valid inputs' do
        before do
          post :update, approvals: [{ id: approval.id, approved: true }]
        end

        it 'updates the approval to true' do
          expect(approval.approved).to eq(true)
        end
      end
    end
  end
end














































