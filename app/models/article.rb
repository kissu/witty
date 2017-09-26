class Article < ApplicationRecord
  belongs_to :user
  has_many :upvotes, dependent: :destroy
  has_and_belongs_to_many :tags

  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :tags, presence: true

  accepts_nested_attributes_for :tags, allow_destroy: true

  include UpvotableConcern
end
