class CreatrixMailer < ApplicationMailer
  default from: 'boalfoldi@gmail.com'

  def creatrix_micro_service_request(microservice_request)
    @microservice_request = microservice_request
    @node = @microservice_request.achievement.node
    @author = @microservice_request.microservice.creatrix
    @emitter = @microservice_request.achievement.node.creatrix
    mail(to: @author.email, subject: 'microservice request') 
  end

  def creatrix_micro_service_accepted(microservice_request)
    @microservice_request = microservice_request
    @node = @microservice_request.achievement.node
    @author = @microservice_request.microservice.creatrix
    @emitter = @microservice_request.achievement.node.creatrix
    mail(to: @emitter.email, subject: 'microservice request accepted') 
  end

  def creatrix_welcome(creatrix)
    @author = creatrix
    mail(to: creatrix.email, subject: 'welcome') 
  end

end
