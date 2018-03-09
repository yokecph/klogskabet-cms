class RemovePasscodeFromDevice < ActiveRecord::Migration[5.1]
  def up
    remove_column :devices, :passcode
  end

  def down
    add_column :devices, :passcode, :string
  end
end
