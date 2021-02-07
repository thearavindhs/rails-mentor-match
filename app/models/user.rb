class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :connection_mentees, class_name: "Connection", foreign_key: "mentor_id"
  has_many :mentees, through: :connection_mentees
  has_one :connection_mentor, class_name: "Connection", foreign_key: "mentee_id"
  has_one :mentor, through: :connection_mentor
end