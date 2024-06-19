class Category < ApplicationRecord
  has_many :article_category_records
  has_many :articles, through: :article_category_records
end
