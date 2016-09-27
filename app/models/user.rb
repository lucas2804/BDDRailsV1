class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :generate_authentication_token!

  scope :excluding_archived, -> { where(archived_at: nil)}

  def archive
    self.update(archived_at: Time.now)
  end

  def not_archived?
    archived_at.nil?
  end
  def active_for_authentication?
    # Custom condition active or not.
    super && not_archived?
  end

  def inactive_message
    # detect error message :inactive or :archived in devise.en.yml
    not_archived? ? super : :archived
  end

  def generate_authentication_token!
    self.auth_token = SecureRandom.hex(16)
    # self.update_column(:api_key, SecureRandom.hex(16))
  end
  # before_create :set_auth_token
  #

  # private
  # def set_auth_token
  #   return if auth_token.present?
  #   self.auth_token = generate_auth_token
  # end
  #
  # def generate_auth_token
  #   loop do
  #     token = SecureRandom.hex
  #     break token unless self.class.exists?(auth_token: token)
  #   end
  # end

end
