class NodesController < ApplicationController
    
    def index
      @nodes = Node.all
      @cards_classes = ["card text-white bg-dark mb-3", "card bg-light mb-3", "card-columns"]
    end

    def show
      @node = Node.find(params[:id])      
      @fundraiser = @node.current_fundraiser
      @fundraiser.funded? ? @fund_status = "The goal is met" : @fund_status = "funding in progress"
      @fundraiser = @node.current_fundraiser

      @per_cent_status = (@fundraiser.current_fundings.ceil * 100) / @fundraiser.goal.ceil
      #$$$$$$$$$$$$$$$$$$$$$---NODE_DATA_HASH---$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
      @node = Node.find(params[:id])      
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
  end