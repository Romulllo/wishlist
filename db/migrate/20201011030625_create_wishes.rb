class CreateWishes < ActiveRecord::Migration[6.0]
  def change
    create_table :wishes do |t|
      t.string :title
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
