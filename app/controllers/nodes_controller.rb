class NodesController < ApplicationController
    layout "index", only: [:index]
    before_action :authenticate_creatrix, only: [:index, :show, :new, :create]
    
    def index
      @digitales = Digitale.all
      puts @digitales.length
      puts "ù" * 60
    end

    def show
      @donated_sum = DonatedSum.new

      @node = Node.find(params[:id])

      if Fundraiser.find_by(microservice_request: @node.achievements.last.microservice_requests.last) #if node.pending_microservice_request.accepted?
        @fundraiser = Fundraiser.find_by(microservice_request: @node.achievements.last.microservice_requests.last)
        @per_cent_status = (@fundraiser.current_fundings.ceil * 100) / @fundraiser.goal.ceil
      end

    end

    def new
      @node = Node.new
    end

    def create

      node = nil 

      case params['type']
      when "Tale" 
        @digitale = Digitale.create(creatrix: current_creatrix)
        puts @digitale
        @nodeable = Tale.create(creatrix: current_creatrix, title: params['content'], description: params['description'])
        @node = Node.new(nodeable: @nodeable, creatrix: current_creatrix, digitale: @digitale, title: @nodeable.title, content: @nodeable.description)

        if @node.save
          respond_to do |format|
            format.js { }
          end
        else
          render :new
        end
  #when "WhatIf"
  #  nodeable = WhatIf.create(creatrix: current_creatrix, sentence: str, description: params['description'])
  #  node = Node.create(nodeable: nodeable, creatrix: current_creatrix, digitale: digitale, title: nodeable.sentence, content: "description feature coming soon")
  #when "MStatement"
  #  nodeable = MStatement.create(creatrix: current_creatrix, sentence: str, description: params['description'])
  #  node = Node.create(nodeable: nodeable, creatrix: current_creatrix, digitale: digitale, title: nodeable.sentence, content: "description feature coming soon")
  #when "Digit"
  #  nodeable = Digit.create(creatrix: current_creatrix, title: params['content'], description: params['description'])
  #  node = Node.create(nodeable: nodeable, creatrix: current_creatrix, digitale: digitale, title: nodeable.title, content: "description feature coming soon")
  #end
  #if Node.all.any? { |node_instance| node_instance == node }
  #    redirect_to node_path(node.id)
  #else
  #    render :new
  #end
      end
    end

    def update
      @tale = Tale.update(title: params['content'], description: params['description'])
      @node = Node.update(title: params['content'], content: params['description'])

      respond_to do |format|
        format.js{ }
      end
    end


end