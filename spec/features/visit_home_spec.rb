require 'rails_helper'

describe 'User visit home page' do
  it 'visit root path' do
    visit root_path

    expect(page).to have_content 'ConnecTI Panel'
  end
end
