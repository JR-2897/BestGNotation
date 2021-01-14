class CreateStudios < ActiveRecord::Migration[6.1]
  def change
    create_table :studios do |t|
      t.string :nameStudio
      t.datetime :dateCreated

      t.timestamps
    end
  end
end
