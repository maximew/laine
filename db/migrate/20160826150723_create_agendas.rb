class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :title
      t.text :content
      t.date :startdate
      t.date :enddate

      t.timestamps null: false
    end
  end
end
