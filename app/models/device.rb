# frozen_string_literal: true

class Device < ApplicationRecord
  validates :name, :mac, :cel, presence: true

  def send_alert
    Twilio::REST::Client.new.messages.create({
      from: TWILIO['twilio_phone_number'],
      to: cel,
      body: "ALERTA #{name.upcase}: Alguém no carro!"
    })
  end
end
