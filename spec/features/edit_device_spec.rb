# frozen_string_literal: true

require 'rails_helper'

describe 'User visit pages' do
  it 'Edit device' do
    device = Device.create(name: 'Jhon Doe', mac: 'ffffffffffff',
                           cel: '11987654321')

    visit root_path
    click_on device.name
    click_on 'Editar'

    fill_in 'Nome', with: 'foo'
    fill_in 'Endereço MAC', with: 'bar'
    fill_in 'Celular', with: '12312312223'
    click_on 'Salvar'

    expect(page).to have_content('foo')
    expect(page).to have_content('bar')
    expect(page).to have_content('12312312223')
  end
end
