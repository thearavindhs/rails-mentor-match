class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[linkedin]

  def matchMe
    MatchAlgorithmJob.perform_now(self)
  end

  has_many :connection_mentees, class_name: "Connection", foreign_key: "mentor_id"
  has_many :mentees, through: :connection_mentees
  has_one :connection_mentor, class_name: "Connection", foreign_key: "mentee_id"
  has_one :mentor, through: :connection_mentor
  has_many :personal_skills
  has_many :skills, through: :personal_skills
  has_one_attached :photo
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :city, presence: true
  # validates :country, presence: true

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.linkedin_data"] && session["devise.linkedin_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture_url = auth.info.picture_url
      user.password = Devise.friendly_token[0, 20]
    end
  end
  
end
