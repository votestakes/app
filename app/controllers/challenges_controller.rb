class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy, :join, :quit]

  # GET /challenges
  def index
    @challenges = Challenge.all
    if current_user
      @my_challenges = Challenge.includes(:users)
                                .where.any_of({creator_id: current_user.id},
                                              "users.id = '#{current_user.id}'")
                                .references(:users)
    end
  end

  # GET /challenges/1
  def show
    if current_user
      @user_joined = @challenge.user_joined?(current_user)
      @user_is_creator = @challenge.creator == current_user
    end
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
    @templates = HTTParty.get('http://memegen.link/api/aliases/?name=votestakes').to_a.shuffle.to_h
  end

  # POST /challenges
  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.creator = current_user
    templates = HTTParty.get('http://memegen.link/api/aliases/?name=votestakes')
    @challenge.meme_style = templates[@challenge.meme_name]['styles'].sample

    if @challenge.save
      redirect_to @challenge, notice: 'Challenge was successfully created.'
    else
      render :new
    end
  end

  # DELETE /challenges/1
  def destroy
    @challenge.destroy
    redirect_to challenges_url, notice: 'Challenge was successfully destroyed.'
  end

  def join
    if current_user
      current_user.accept_challenge(@challenge)
      redirect_to @challenge, notice: 'You have joined this challenge!'
    else
      redirect_to user_omniauth_authorize_path(:facebook), notice: 'You must sign up first'
    end
  end

  def quit
    @challenge.users.delete(current_user)
    redirect_to @challenge, notice: 'You have quit this challenge.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def challenge_params
      params.permit(:date, :event_id, :challenger, :challengee, :emotion, :stakes, :meme_name, :meme_style)
    end
end
