class AddAttachmentImageToPortals < ActiveRecord::Migration
  def self.up
    change_table :portals do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :portals, :image
  end
end
