class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
  # devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :upvotes, dependent: :nullify
  has_many :articles, dependent: :nullify

  enum role: { entrepreneur: 0, expert: 10, investisseur: 20, super_admin: 30 }

  include UpvotableConcern

  def name
    email
  end
end
