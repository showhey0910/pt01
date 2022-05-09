class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :post, foreign_key: true
      t.text :content
      # t.references :post, foreign_key: true, null: false

      t.timestamps
    end
  end
end
