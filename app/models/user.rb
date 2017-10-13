class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
  # devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :upvotes, dependent: :nullify
  has_many :articles, dependent: :nullify
  validate :password_complexity

  enum role: { entrepreneur: 0, super_admin: 30 }

  include UpvotableConcern

  def name
    email
  end

  def password_complexity
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./)
      errors.add :password, "Must include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end
end
