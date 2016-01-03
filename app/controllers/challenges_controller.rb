class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy, :join, :quit]

  # GET /challenges
  def index
    @challenges = Challenge.all
  end

  # GET /challenges/1
  def show
    if current_user
      @user_joined = @challenge.users.where(id: current_user.id).any?
    end
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.users << current_user

    if @challenge.save
      redirect_to @challenge, notice: 'Challenge was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /challenges/1
  def update
    if @challenge.update(challenge_params)
      redirect_to @challenge, notice: 'Challenge was successfully updated.'
    else
      render :edit
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
      # synthesize the description
      params[:description] = "#{params[:friends]} #{params[:event]}"
      params.permit(:date, :description)
    end
end
