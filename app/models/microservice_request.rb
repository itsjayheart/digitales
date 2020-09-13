class MicroserviceRequest < ApplicationRecord
    belongs_to :achievement
    belongs_to :microservice

    has_many :fundraisers

    has_one_attached :art_work

end
