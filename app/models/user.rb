class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :observations, dependent: :destroy
  has_many :patients, through: :observations
  has_many :comments
  has_many :likes
  has_many :liked_observations, through: :likes, source: :observation

# creates a new like row with post_id and user_id
  def like!(observation_id)
    self.likes.create(observation_id: observation_id)
  end

  # destroys a like with matching post_id and user_id
  def unlike!(observation_id)
    like = self.likes.find_by(observation_id: observation_id)
    like.destroy
  end

  # returns true of false if a post is liked by user
  def like?(observation_id)
    self.likes.find_by(observation_id: observation_id)
  end

end
