class User < ApplicationRecord
  has_secure_password
  has_attached_file :profile_picture,
                    :styles => {medium: "300x300>", thumb: "100x100#"},
                    default_url: "assets/default.jpeg"
  validates_attachment_content_type :profile_picture, content_type: /\Aimage\/.*\Z/
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
   validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
   validates :username, uniqueness: true
   validates :username, :birthday, presence: true
   validates :password, confirmation: true, length: {minimum: 7}, on: :create
   validates :zipcode, length: {is:5}
   has_many :user_interests
   has_many :interests, class_name: "Interest", through: 'user_interests'
   has_many :pictures
   has_one :preference, dependent: :destroy
   has_many :matches
   has_many :messages
   has_many :favorites

   before_save :add_state_city

   private
   def add_state_city
     location = ZipCodes.identify(self.zipcode)
     self.city = location[:city]
     self.state = location[:state_code]
   end

end
