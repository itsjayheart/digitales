class NodesController < ApplicationController
    layout "index", only: [:index]
    
    def index
      @nodes = Node.all
    end

    def show
      @donated_sum = DonatedSum.new

      @node = Node.find(params[:id])

      if Fundraiser.find_by(microservice_request: @node.achievements.last.microservice_requests.last) #if node.pending_microservice_request.accepted?
        @fundraiser = Fundraiser.find_by(microservice_request: @node.achievements.last.microservice_requests.last)
        #@fundraiser.funded? ? @fund_status = "The goal is met!" : @fund_status = "funding in progress"
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
        nodeable = Tale.create(creatrix: current_creatrix, title: params['content'], description: params['description'])
        node = Node.create(nodeable: nodeable, creatrix: current_creatrix, title: nodeable.title, content: "description feature coming soon")
      when "WhatIf"
        subject = params['new_subject_setting_content']

        verb = params['new_verb_setting_content']

        object = params['new_object_setting_content']

        str = "WHAT IF " + subject + ' ' + verb + ' ' + object

        nodeable = WhatIf.create(creatrix: current_creatrix, sentence: str, description: params['description'])
        node = Node.create(nodeable: nodeable, creatrix: current_creatrix, title: nodeable.sentence, content: "description feature coming soon")
      when "MStatement"
        subject = params['new_subject_setting_content']

        verb = params['new_verb_setting_content']

        object = params['new_object_setting_content']

        str = "MIGHT OR MIGHT NOT " + subject + ' ' + verb + ' ' + object

        nodeable = MStatement.create(creatrix: current_creatrix, sentence: str, description: params['description'])
        node = Node.create(nodeable: nodeable, creatrix: current_creatrix, title: nodeable.sentence, content: "description feature coming soon")
      when "Setting"
        nodeable = Setting.create(creatrix: current_creatrix, full_name: params['content'], description: params['description'])
        node = Node.create(nodeable: nodeable, creatrix: current_creatrix, title: nodeable.full_name, content: "description feature coming soon")
      when "Digit"
        nodeable = Digit.create(creatrix: current_creatrix, title: params['content'], description: params['description'])
        node = Node.create(nodeable: nodeable, creatrix: current_creatrix, title: nodeable.title, content: "description feature coming soon")
      end

      if Node.all.any? { |node_instance| node_instance == node }
          redirect_to node_path(node.id)
      else
          render :new
      end

    end


end