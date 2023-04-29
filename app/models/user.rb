class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


  valid_states = [
    "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado",
    "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho",
    "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana",
    "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
    "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada",
    "New Hampshire", "New Jersey", "New Mexico", "New York",
    "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon",
    "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota",
    "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington",
    "West Virginia", "Wisconsin", "Wyoming"
  ]

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true, length: { maximum: 255 }
  validate :email_format
  def email_format
    unless email.blank? || email.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
      errors.add(:email, "is not a valid email address")
    end
  end
  #
  # validates :password, presence: true, length: { minimum: 6 }
  # validates :password_confirmation, length: { minimum: 6 }
  # validate :passwords_match
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }, length: { minimum: 8, maximum: 15 }
  validates :address_line_1, presence: true
  validates :address_line_2, presence: true, allow_blank: true
  validates :zip, presence: true, format: { with: /\A\d{5}\z/ }
  validates :city, presence: true, format: { with: /\A[a-zA-Z\u00C0-\u017F']+(\s[a-zA-Z\u00C0-\u017F']+)*\z/ }
  validates :state, presence: true, inclusion: { in: valid_states }
  validates :gender, presence: true, inclusion: { in: %w(Male Female Other Prefer not to say) }
  # validates :date_of_birth, format: { with: /\A\d{2}\/\d{2}\/\d{4}\z/, message: "must be in the format MM/DD/YYYY" }

  # validates :date_of_birth, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "must be in the format yyyy-mm-dd" }

  validate :valid_year_format

  private

  def valid_year_format
    if date_of_birth.present? && date_of_birth.year.to_s.length != 4
      errors.add(:date_of_birth, "year must be 4 digits")
    end
  end
  # #
  # # validates :date_of_birth, presence: true
  # # validate :date_of_birth_valid?
  # #
  # # def date_of_birth_valid?
  # #   dob = Date.parse(date_of_birth) rescue nil
  # #   if dob > Date.today
  # #     errors.add(:date_of_birth, "cannot be in the future")
  # #   elsif dob.year < 1880
  # #     errors.add(:date_of_birth, "cannot be before 1880")
  # #   end
  # # end
  #
  # def passwords_match
  #   errors.add(:password_confirmation, "does not match") unless password_confirmation == password
  # end

end
