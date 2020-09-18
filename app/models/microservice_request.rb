class MicroserviceRequest < ApplicationRecord
  
  belongs_to :achievement
  belongs_to :microservice
  belongs_to :microservice_category
  has_many :fundraisers
  has_one_attached :art_work

end