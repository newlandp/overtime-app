require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq 200
    end

    it 'has a title of posts' do
      expect(page).to have_content(/Posts/)
    end

    it "has a list of posts" do
      post1 = FactoryGirl.create(:post, user: @user)
      post2 = FactoryGirl.create(:second_post, user: @user)

      visit posts_path

      expect(page).to have_content post1.rationale
      expect(page).to have_content post2.rationale
    end

    it 'has a scope so that only post creators can see their posts' do
      post1 = FactoryGirl.create(:post, user: @user)
      post2 = FactoryGirl.create(:second_post, user: @user)
      post_from_other_user = FactoryGirl.create(:another_post, user: FactoryGirl.create(:non_authorized_user))

      visit posts_path

      expect(page).to_not have_content post_from_other_user.rationale
      expect(page).to have_content post1.rationale
      expect(page).to have_content post2.rationale
    end
  end

  describe 'new' do
    it 'has a link on the homepage' do
      visit root_path

      click_link 'new_post_from_nav'
      expect(page).to have_http_status '200'
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      post = FactoryGirl.create(:post, user: @user)
      visit posts_path

      click_link "delete_post_#{post.id}_from_index"
      expect(page).to have_http_status '200'
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it "has a form that can be reached" do
      expect(page.status_code).to eq 200
    end

    it "can be created from new form page" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "some rationale"
      click_on "Save"

      expect(page).to have_content("some rationale")
    end

    it "will have a user associated with it" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User_Association"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq "User_Association"
    end
  end

  describe 'edit' do
    before do
      @post = FactoryGirl.create(:post, user: @user)
    end

    it 'can be edited' do
      visit edit_post_path(@post.id)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "edited content"
      click_on "Save"

      expect(page).to have_content("edited content")
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user, scope: :user)

      visit edit_post_path(@post.id)

      expect(page).to have_current_path root_path
    end
  end
end

