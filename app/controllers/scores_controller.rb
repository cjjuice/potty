class ScoresController < ApplicationController
  def new
      vid = params[:vid]
      @bathroom = Bathroom.where(vid: vid).first
      session[:bathroom] = @bathroom.id
      
      scores = @bathroom.scores 
      total = 0
      
      scores.each do |score|
        total = total + score.value  
      end
      
      @average_rating = (total/(scores.count.to_f)).round(2)
      
      @score = Score.new
  end
  
  def create
    @score = Score.new(params[:score])
    @score.bathroom = Bathroom.find(session[:bathroom])  
    bathroom_vid = Bathroom.find(session[:bathroom]).vid
    if @score.save
      redirect_to "/scores/create/#{bathroom_vid}", :notice => "successfully"
    else
      render "new"
    end   
  end
end
