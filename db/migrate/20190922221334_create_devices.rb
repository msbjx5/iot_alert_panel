class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :mac
      t.string :cel

      t.timestamps
    end
  end
end
