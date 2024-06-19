class CreateArticleCategoryRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :article_category_records, id: :uuid do |t|
      t.references :article, null: false, foreign_key: true, type: :uuid
      t.references :category, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
