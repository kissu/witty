class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
  # devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_tags, dependent: :destroy
  has_many :tags, through: :user_tags
  has_many :article_tags, through: :tags
  has_many :articles, dependent: :destroy

  enum role: { entrepreneur: 0, expert: 10, investisseur: 20, super_admin: 30}

  #include UpvotableConcern
end
