class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def send_confirmation_instructions
    self.confirmation_token = Devise.friendly_token
    print(self.confirmation_token)

    # Reset the confirmation status and send the confirmation email
    self.confirmed_at = nil
    self.confirmation_sent_at = Time.now.utc
    save(validate: false)

    #self.confirmation_token = Devise.token_generator.generate(User, :confirmation_token).first
    send_devise_notification(:confirmation_instructions, confirmation_token, {})
  end
end
