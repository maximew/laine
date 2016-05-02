class AddAttachmentImageToDoors < ActiveRecord::Migration
  def self.up
    change_table :doors do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :doors, :image
  end
end
