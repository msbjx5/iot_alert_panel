# frozen_string_literal: true

class Device < ApplicationRecord
  validates :name, :mac, :cel, presence: true

  def send_alert
    client = Twilio::REST::Client.new
    client.messages.create({
      from: TWILIO['twilio_phone_number'],
      to: cel,
      body: "ALERTA #{name.upcase}: Alguém no carro!"
    })
  end
end
