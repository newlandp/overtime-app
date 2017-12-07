require 'rails_helper'

describe 'navigate' do
  let(:post) { FactoryGirl.create(:post, user: FactoryGirl.create(:user)) }
  
  before do
    @admin_user = FactoryGirl.create(:admin_user)
    login_as @admin_user, scope: :user
  end

  describe 'edit' do
    it 'has a status that can be edited on the form' do
      visit edit_post_path(post.id)
      
      choose 'post_status_approved'
      click_on 'Save'

      expect(post.reload.status).to eq 'approved'
    end
  end
end