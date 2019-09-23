require 'rails_helper'

describe 'User visit pages' do
  it 'visit root path' do
    device = Device.create(name: 'Jhon Doe', mac: 'ffffffffffff',
                           cel: '11987654321')
    visit root_path

    expect(page).to have_content('IOT Panel')
    expect(page).to have_css('td', text: device.name)
    expect(page).to have_css('td', text: device.mac)
  end

  it 'visit register path' do
    device = Device.new(name: 'Jhon Doe', mac: 'ffffffffffff',
                        cel: '11987654321')

    visit root_path
    click_on 'Cadastrar device'

    fill_in 'Nome', with: device.name
    fill_in 'Endereço MAC', with: device.mac
    fill_in 'Celular', with: device.cel
    click_on 'Salvar'

    expect(page).to have_content(device.name)
    expect(page).to have_content(device.mac)
    expect(page).to have_content(device.cel)
  end
end
