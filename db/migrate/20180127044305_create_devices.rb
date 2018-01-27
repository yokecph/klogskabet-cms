class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :name, unique: true
      t.string :kind
      t.datetime :last_contact
      t.string :passcode
      t.string :eth_ip
      t.string :wlan_ip

      t.timestamps
    end
  end
end
