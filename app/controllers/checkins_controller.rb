class CheckinsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    checkin = JSON.parse(params['checkin'])
    if params[:secret] == 'P54CNYFVKTWOOEKTHRPPGWC5Q3PYA5GBRR101LYGGMNQYDFK'
      bathrooms = Bathroom.where(vid: checkin['venue']['id'])
      b_count = bathrooms.count
      if b_count == 1 
        scores = bathrooms.first.scores 
        total = 0
        
        scores.each do |score|
          total = total + score.value  
        end
        
        average_rating = total/scores.count
          
        reply_text = "There is one bathroom here, it has an average rating of #{average_rating.to_f} out of 5 stars. Add your own rating!"
      elsif b_count > 1
        total = 0
        btotal = 0
        
        bathrooms.each do |bathroom|
          scores = bathroom.scores
            scores.each do |score|
              total = total + score.value  
            end
          btotal = btotal + (total/scores.count).to_f  
        end  
        
        average_b_rating = (btotal/b_count).to_f
        
        reply_text ="There is #{b_count} bathrooms here with an average rating of #{average_b_rating.to_f} out of 5 stars. Check out the details!" 
      else
        reply_text ="Mayday! There are no bathrooms recorded here. Add one!"
      end      
    else
      raise  "secret does not match"
    end  
    
    user = FoursquareUser.find_by_foursquare_id(checkin['user']['id'])
    user.client.create_checkin_reply(checkin['id'], text: reply_text, url: "http://www.foo.com/")
    return head :ok
  end
end