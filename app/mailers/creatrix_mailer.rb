class CreatrixMailer < ApplicationMailer
  default from: 'balfoldi@yahoo.fr'

  def creatrix_micro_service_request(creatrix)
    mail(to: @creatrix.email, subject: 'micro service request') 
  end

  def creatrix_micro_service_accepted(creatrix)
    mail(to: @creatrix.email, subject: 'micro service accepted') 

  end

  def creatrix_welcome(creatrix)
    mail(to: @creatrix.email, subject: 'welcome') 
  end

end
