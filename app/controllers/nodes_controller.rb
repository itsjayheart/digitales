class NodesController < ApplicationController
    layout "digitales", only: [:new]
    layout "index", only: [:index]
    before_action :authenticate_creatrix, only: [:index, :show, :new, :create]
    
    def index
      @digitales = Digitale.all
    end

    def show
      @donated_sum = DonatedSum.new

      @node = Node.find(params[:id])

      if Fundraiser.find_by(microservice_request: @node.achievements.last.microservice_requests.last)
        @fundraiser = Fundraiser.find_by(microservice_request: @node.achievements.last.microservice_requests.last)
        @per_cent_status = (@fundraiser.current_fundings.ceil * 100) / @fundraiser.goal.ceil
      end

    end

    def new
      @chapters = ["I", "II", "III", "IIII", "V", "VI", "VII"]
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