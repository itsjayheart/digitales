class CreatrixMailer < ApplicationMailer
  default from: 'balfoldi@yahoo.fr'

  #UserMailer.creatrix_micro_service_request(creatrix).deliver_now
  def creatrix_micro_service_request(creatrix)
    mail(to: @creatrix.email, subject: 'micro service request') 

  end

  def creatrix_micro_service_accepted(creatrix)
    mail(to: @creatrix.email, subject: 'micro service accepted') 

  end

end
