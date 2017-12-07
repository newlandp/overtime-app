require 'rails_helper'

describe 'admin dashboard' do
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  let(:user) { FactoryGirl.create(:user) }

  it 'can be reached successfully by admin user' do
    login_as admin_user, scope: :user
    visit admin_root_path
    expect(page).to have_current_path admin_root_path
  end

  it 'cannot be reached by non-admin users' do
    logout(:admin_user)
    login_as user, scope: :user
    visit admin_root_path
    expect(page).to have_current_path root_path
  end

  it 'does not allow visitors access without signing in' do
    logout(:user)
    visit admin_root_path
    expect(page).to have_current_path new_user_session_path
  end
end