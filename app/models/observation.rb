class Observation < ActiveRecord::Base
  belongs_to :patient
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liking_users, through: :likes, source: :user
end
