class Article < ApplicationRecord
  has_rich_text :content
  has_one_attached :cover_photo

  has_many :article_category_records
  has_many :categories, through: :article_category_records
end
