class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
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
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :country, presence: true
end
