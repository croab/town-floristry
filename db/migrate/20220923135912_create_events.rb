class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :date
      t.time :time
      t.string :theme
      t.float :price
      t.string :summary
      t.text :description
      t.string :location
      t.timestamps
    end
  end
end
