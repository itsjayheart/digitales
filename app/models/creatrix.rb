class Creatrix < ApplicationRecord
  after_create :default_avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :microservices

  has_many :digitales

  has_many :tales
  has_many :what_ifs
  has_many :m_statements
  has_many :digits

  has_many :nodes

  has_many :donated_sums

  has_one_attached :avatar

  def default_avatar
    self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_avatar.jpg')), filename: 'default_avatar.jpg', content_type: 'image/png')
  end


end
