class AddAttachmentImageToGarages < ActiveRecord::Migration
  def self.up
    change_table :garages do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :garages, :image
  end
end
