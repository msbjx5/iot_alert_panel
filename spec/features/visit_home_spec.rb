require 'rails_helper'

describe 'User visit pages' do
  it 'visit root path' do
    visit root_path

    expect(page).to have_content('ConnecTI Panel')
  end

  it 'visit register path' do
    device = Device.new(name: 'Jhon Doe', mac: 'ffffffffffff',
                        cel: '11987654321')

    visit root_path
    click_on 'Cadastrar device'

    fill_in 'Nome', with: device.name
    fill_in 'Endereço MAC', with: device.mac
    fill_in 'Celular', with: device.cel
    click_on 'Criar'
    
    expect(page).to have_content(device.name)
    expect(page).to have_content(device.mac)
    expect(page).to have_content(device.cel)
  end
end
