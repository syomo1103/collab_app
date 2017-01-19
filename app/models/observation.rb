class Observation < ActiveRecord::Base
  belongs_to :patient
  belongs_to :user
  has_many :comments, dependent: :destroy
end
