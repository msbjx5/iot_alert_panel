require 'rails_helper'
Capybara.current_driver = :selenium

describe 'User deletes device' do
  xit 'Successfully' do
    device = Device.create(name: 'Ze', mac: 'ffffffffffff', cel: '11987654321')

    visit root_path
    click_on device.name
    click_link 'Apagar'

    expect(page).not_to have_content device.name
  end
end
