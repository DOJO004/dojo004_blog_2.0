class ArticleCategoryRecord < ApplicationRecord
  belongs_to :article
  belongs_to :category
end
