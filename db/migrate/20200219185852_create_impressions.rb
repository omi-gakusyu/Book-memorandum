class CreateImpressions < ActiveRecord::Migration[5.2]
  def change
    create_table :impressions do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.string :star
      t.text :content

      t.timestamps
    end
  end
end
