class Contact < ApplicationRecord
  has_and_belongs_to_many :tags
  validates :description, presence: true
  validates :title, presence: true
end
