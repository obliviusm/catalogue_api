class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :category, foreign_key: true, null: false
      t.string :name, null: false
      t.decimal :price, null: false, default: 0, precision: 8, scale: 2
      t.text :description
      t.string :slug, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
