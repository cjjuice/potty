class BathroomsController < ApplicationController
  def create
  end

  def show
    vid = params[:vid]
    @bathroom = Bathroom.where(vid: vid).first
  end
end
