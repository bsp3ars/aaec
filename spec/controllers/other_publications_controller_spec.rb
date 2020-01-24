# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe OtherPublicationsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Publication. As you add validations to Publication, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { 'author_first_name' => ['Test'], 'author_last_name' => ['Case'], 'college_ids' => ['', '1', '4'], 'uc_department' => 'Test', 'work_title' => 'Test', 'other_title' => 'Test', 'volume' => 'Test', 'issue' => 'Test', 'page_numbers' => 'Test', 'publisher' => 'Test', 'city' => 'Test', 'publication_date' => 'Test', 'url' => 'Test', 'doi' => 'Test' }
  end

  let(:invalid_attributes) do
    { 'author_first_name' => ['Bad'], 'author_last_name' => [''], 'college_ids' => [''], 'uc_department' => '', 'work_title' => '', 'other_title' => '', 'volume' => '', 'issue' => '', 'page_numbers' => '', 'publisher' => '', 'city' => '', 'publication_date' => '', 'url' => '', 'doi' => '' }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PublicationsController. Be sure to keep this updated too.
  let(:valid_session) { { submitter_id: 1 } }

  describe 'GET #index' do
    before do
      Submitter.create!(
        first_name: 'First Name',
        last_name: 'Last Name',
        college: 2,
        department: 'Department',
        mailing_address: 'Mailing Address',
        phone_number: '111-111-1111',
        email_address: 'test@mail.uc.edu'
      )
    end

    it 'returns a success response' do
      OtherPublication.create! valid_attributes
      get :index, session: valid_session
      expect(response).to redirect_to('/publications')
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      other_publication = OtherPublication.create! valid_attributes
      get :show, params: { id: other_publication.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      other_publication = OtherPublication.create! valid_attributes
      get :edit, params: { id: other_publication.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Other Publication' do
        expect do
          post :create, params: { other_publication: valid_attributes }, session: valid_session
        end.to change(OtherPublication, :count).by(1)
      end

      it 'redirects to the publication index' do
        post :create, params: { other_publication: valid_attributes }, session: valid_session
        expect(response).to redirect_to(publications_path)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { other_publication: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested other publication' do
        other_publication = OtherPublication.create! valid_attributes
        put :update, params: { id: other_publication.to_param, other_publication: new_attributes }, session: valid_session
        other_publication.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the other_publication' do
        other_publication = OtherPublication.create! valid_attributes
        put :update, params: { id: other_publication.to_param, other_publication: valid_attributes }, session: valid_session
        expect(response).to redirect_to(other_publication)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        other_publication = OtherPublication.create! valid_attributes
        put :update, params: { id: other_publication.to_param, other_publication: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested other_publication' do
      other_publication = OtherPublication.create! valid_attributes
      expect do
        delete :destroy, params: { id: other_publication.to_param }, session: valid_session
      end.to change(OtherPublication, :count).by(-1)
    end

    it 'redirects to the other_publications list' do
      other_publication = OtherPublication.create! valid_attributes
      delete :destroy, params: { id: other_publication.to_param }, session: valid_session
      expect(response).to redirect_to(other_publications_url)
    end
  end
end
