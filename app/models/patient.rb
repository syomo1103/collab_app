class Patient < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :observations
  has_many :users, through: :observations

  # def self.search(search)
  #   if search
  #     where("first_name LIKE ?", "%#{search}%")
  #   else
  #     current_user.patients.distinct
  #   end
  # end

  def self.search(search)
    if search
      Patient.all.where("LOWER(first_name) LIKE ?", "%#{search}%".downcase)
    else
      @my_patients
    end
  end

end
