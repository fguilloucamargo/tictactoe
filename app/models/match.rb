class Match < ApplicationRecord
  belongs_to :user

  has_many :user_choices
end
