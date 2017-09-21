class Tag < ApplicationRecord
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :contacts

  validates :name, presence: true, uniqueness: true
end
