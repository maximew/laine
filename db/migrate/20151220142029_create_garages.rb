class CreateGarages < ActiveRecord::Migration
  def change
    create_table :garages do |t|
      t.string :image
      t.belongs_to :category, index: true

      t.timestamps null: false
    end
  end
end
