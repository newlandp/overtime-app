require 'rails_helper'

describe 'navigate' do
  describe 'homepage' do
    it 'can be reached successfully' do
      logout(:user)
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end
end