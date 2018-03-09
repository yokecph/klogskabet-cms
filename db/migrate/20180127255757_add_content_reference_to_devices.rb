class AddContentReferenceToDevices < ActiveRecord::Migration[5.1]
  def change
    add_reference :devices, :content, polymorphic: true
  end
end
