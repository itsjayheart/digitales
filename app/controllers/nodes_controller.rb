class NodesController < ApplicationController
    layout "index", only: [:index]
    
    def index
      @nodes = Node.all
    end

    def show
      @donated_sum = DonatedSum.new

      @node = Node.find(params[:id])    
      if Fundraiser.find_by(microservice_request: @node.achievements.last.microservice_requests.last)
        @fundraiser = Fundraiser.find_by(microservice_request: @node.achievements.last.microservice_requests.last)
        @fundraiser.funded? ? @fund_status = "The goal is met" : @fund_status = "funding in progress"
        @per_cent_status = (@fundraiser.current_fundings.ceil * 100) / @fundraiser.goal.ceil
      end
      
      #$$$$$$$$$$$$$$$$$$$$$---NODE_DATA_HASH---$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
      @achievements_node = Hash.new
      @node.achievements.each do |achievment| 
        achievement_microservices = []
        achievment.microservices.each { |microservice| achievement_microservices << microservice.microservice_category.name}
        @achievements_node[achievment.achievement_category.name] = achievement_microservices
      end  
      #$$$$$$$$$$$$$$$$$$$$$---NODE_DATA_HASH---$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

      #$$$$$$$$$$$$$$$$$$$$$---STATICS_DATA_ARRAYS---$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
        #achievements
        achievements = ["CREATIVE WRITING", "2D DIGITAL ART", "3D DIGITAL ART", "ACTING", "EDITING", "COMPOSING"]
        #micro_services
        wri_micros = ["1.5k synopsis", "10k words one-shot", "10k words one-shot: screenplay translation"]
        flat_micros = ["2D character design", "2D prop design", "50-150 panels webcomic : thumbnail", "50-150 panels webcomic :sketching", "50-150 panels webcomic : lineart", "50-150 panels webcomic : flats", "50-150 panels webcomic : shadows and highlights", "50-150 panels webcomic : backgrounds", "50-150 panels webcomic : cover"]          
        volume_micros = ["3D modeling : character design", "3D modeling : prop design", "3D scenery artwork", "3D character artwork", "3D rigging of a character", "1-3 minutes animated scene"]          
        act_micros = ["1-3 minutes animated scene voice acting"]          
        editing_micros = ["1-3 minutes animated scene editing"]          
        music_micros = ["1-3 minutes music theme"] 
        microservices = [wri_micros, flat_micros, volume_micros, act_micros, editing_micros, music_micros]
      #$$$$$$$$$$$$$$$$$$$$$---STATICS_DATA_ARRAYS---$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
      
      @achievments_status = Hash.new
      (achievements.length-1).times do |i| 
        if @achievements_node.keys.include?(achievements[i]) 
          (microservices[i].length).times do |x| 
            if @achievements_node[achievements[i]].include?(microservices[i][x])
              microservices[i][x] = [microservices[i][x], "text-primary"]
            else
              microservices[i][x] = [microservices[i][x], "text-secondary"]
            end
          end
        else
          (microservices[i].length).times do |x| 
            microservices[i][x] = [microservices[i][x], "text-secondary"]
          end
        end
        @achievments_status[achievements[i]] = microservices[i]
      end
      
      #achievements
      @status_achievement = ["text-secondary"]
      puts ("%"*100)
      puts @achievments_status
      puts ("%"*100)
      puts ("$"*100)
      puts @achievements_node
      puts ("$"*100)
      #microservices

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