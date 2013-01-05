class BathroomsController < ApplicationController
  def new
      vid = params[:vid]
      session[:vid] = vid

      @bathroom = Bathroom.new
  end
  
  def create
    @bathroom = Bathroom.new(params[:score])
    @bathroom.vid = session[:vid]
    if @bathroom.save
      redirect_to "/scores/create/#{session[:vid]}", :notice => "Bathroom Added! Now rate it!"
    else
      render "new"
    end   
  end
end
