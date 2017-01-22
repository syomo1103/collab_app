class Patient < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :observations
  has_many :users, through: :observations

  def self.search(search)
    if search
      where("first_name LIKE ?", "%#{search}%".downcase)
      where("last_name LIKE ?", "%#{search}%".downcase)
    else
      @my_patients
    end
  end

  # def self.search(search)
  #   where("first_name ILIKE ?", "%#{search}%")
  #   where("last_name ILIKE ?", "%#{search}%")
  # end

end
