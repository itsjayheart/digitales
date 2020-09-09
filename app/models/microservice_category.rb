class MicroserviceCategory < ApplicationRecord

	has_many :microservices

	belongs_to :achievement_category

end
