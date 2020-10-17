class DigitalesController < ApplicationController

  def create
    @chapters = ["I", "II", "III", "IIII", "V", "VI", "VII"]
    creatrix = current_creatrix
    @digitale = Digitale.create(creatrix: creatrix)
    nodable = Tale.create(creatrix: creatrix) 
    node = Node.new(nodeable: nodable, title: params[:title_tale], content: params[:content_tale], creatrix: creatrix, digitale: @digitale)
    if node.save
      nodable = WhatIf.create(creatrix: creatrix)
      node = Node.new(nodeable: nodable, title: params[:title_what_if] , content: params[:content_what_if] , creatrix: creatrix, digitale: @digitale)
      if node.save
        7.times do |x|
          nodable = MStatement.create(creatrix: creatrix)
          node = Node.new(nodeable: nodable, title: params["title_mst#{x}"] , content: params["content_mst#{x}"] , creatrix: creatrix, digitale: @digitale)
          unless node.save
            nodable.delete
            @digitale.delete
            @errors = "The chapter #{@chapters[x]} is preventing you from creating because #{node.errors.full_messages.to_sentence}"
            break
          end
        end
      else
        @digitale.delete
        nodable.delete
        @errors = "The What if is preventing you from creating because #{node.errors.full_messages.to_sentence}"
      end      
    else
      @digitale.delete
      nodable.delete
      @errors = "The Tales is preventing you from creating because #{node.errors.full_messages.to_sentence}"
    end
    
    puts @errors
    respond_to do |format|
      format.html { redirect_to new_node_path }
      format.js { }
    end
  end

  def show
  	@digitale = Digitale.find(params['id'])
    @achievement_categories = AchievementCategory.all
  	@digitale.m_statements.sort { |a, b|  a.id <=> b.id }.each do |m_statement|
      if m_statement.non_achieved
        if m_statement.in_production? == false
          m_statement.update(in_production?: true)
            @current_node = m_statement
            break
        else 
          @current_node = m_statement
          break
        end
      end
    end
    
  	@donated_sum = DonatedSum.new

    if Fundraiser.find_by(microservice_request: @current_node.non_achieved.microservice_requests.last)
      @fundraiser = Fundraiser.find_by(microservice_request: @current_node.non_achieved.microservice_requests.last)
      @per_cent_status = (@fundraiser.current_fundings.ceil * 100) / @fundraiser.goal.ceil
    end
  end
end