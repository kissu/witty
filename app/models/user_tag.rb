class UserTag < ApplicationRecord
  belongs_to :tag
  belongs_to :user
end
