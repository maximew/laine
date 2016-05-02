class AddAttachmentImageToShutters < ActiveRecord::Migration
  def self.up
    change_table :shutters do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :shutters, :image
  end
end
