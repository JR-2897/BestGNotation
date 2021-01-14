class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.decimal :note
      t.datetime :datePublished
      t.references :categories, null: false, foreign_key: true
      t.references :studios, null: false, foreign_key: true
      t.references :platforms, null: false, foreign_key: true

      t.timestamps
    end
  end
end
