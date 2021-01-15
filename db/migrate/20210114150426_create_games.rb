class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.decimal :note
      t.date :datePublished
      t.references :category, null: false, foreign_key: true
      t.references :studio, null: false, foreign_key: true
      t.references :platform, null: false, foreign_key: true
      t.timestamps
    end
  end
end
