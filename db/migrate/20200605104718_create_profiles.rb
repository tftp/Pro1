class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :nickname, null: false, index: { unique: true }
      t.string :telefon
      t.text :description
      t.boolean :telefon_confirm, null: false, default: false
      t.belongs_to  :user, index: { unique: true }, null: false, foreign_key: true

      t.timestamps
    end
  end
end
