class Tag < ApplicationRecord
  has_many :article_tags
  has_many :user_tags
end
