class CreateToons < ActiveRecord::Migration[5.0]
  def change
    create_table :toons do |t|
      t.references :artist, foreign_key: true
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
