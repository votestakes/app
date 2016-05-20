class FeedController < ApplicationController

  # GET /feed
  def index
    @challenges = Challenge.order(updated_at: :desc).limit(9)
  end

end
