class Patient < ActiveRecord::Base
  has_many :observations
  has_many :users, through: :observations
end
