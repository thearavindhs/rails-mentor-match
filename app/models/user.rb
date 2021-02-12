class User < ApplicationRecord
  after_create :printNew

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :connections

  def printNew
    MatchAlgorithmJob.perform_later(self)
  end
end
