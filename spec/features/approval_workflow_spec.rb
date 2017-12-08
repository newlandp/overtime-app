require 'rails_helper'

describe 'navigate' do
  let(:post) { FactoryGirl.create(:post, user: FactoryGirl.create(:user)) }
  
  before do
    @admin_user = FactoryGirl.create(:admin_user)
    login_as @admin_user, scope: :user
  end

  describe 'edit' do
    before do
      visit edit_post_path(post.id)
    end

    it 'has a status that can be edited on the form by an admin' do
      choose 'post_status_approved'
      click_on 'Save'

      expect(post.reload.status).to eq 'approved'
    end

    it 'cannot be edited by a non admin' do
      logout(:user)
      user = post.user
      login_as(user, scope: :user)

      visit edit_post_path(post.id)

      expect(page).to_not have_content 'Approved'
    end
  end
end