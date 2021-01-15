class ChangeColumnInTable < ActiveRecord::Migration[6.1]
  def change
    change_column(:studios, :dateCreated, :date)
    change_column(:games, :datePublished, :date)
  end
end
