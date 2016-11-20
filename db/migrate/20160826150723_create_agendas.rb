class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :title
      t.text :content
      t.startdate :date
      t.enddate :date

      t.timestamps null: false
    end
  end
end
