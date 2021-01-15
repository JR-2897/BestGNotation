class CreateStudios < ActiveRecord::Migration[6.1]
  def change
    create_table :studios do |t|
      t.string :nameStudio
      t.date :dateCreated

      t.timestamps
    end
  end
end
