class Creatrix < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :microservices

  has_many :tales
  has_many :what_ifs
  has_many :m_statements
  has_many :settings
  has_many :digits

  has_many :nodes

  has_many :funraisers

  has_many :donated_sums

end
