class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :observation

  validates :user_id, uniqueness: { scope: :observation_id }
end
