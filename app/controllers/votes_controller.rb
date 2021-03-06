class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  # load_and_authorize_resource

  # GET /votes
  # GET /votes.json
  def index

    @votes = Vote.joins(dates_to_vote: :event).joins(:guest).where("guests.user_id= #{current_person.id}")

  end

  # GET /votes/1
  # GET /votes/1.json
  def show


  end

  # GET /votes/new
  def new
    @dates_to_vote = DatesToVote.find(params[:dates_to_vote_id])
    @vote = Vote.new

  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    @dates_to_vote = DatesToVote.find(params[:dates_to_vote_id])
    @vote = current_person.votes.new(vote_params)
    @vote.dates_to_vote = @dates_to_vote


    #  @vote.dates_to_vote = @guest


    respond_to do |format|
      if @vote.save
        format.html { redirect_to user_path(current_person), notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vote_params
      params.fetch(:vote, {}).permit(:event_id, :dates_to_vote_id,
                                     dates_to_votes_attributes: [:event_id, :date])
    end
end
