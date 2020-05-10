class DatesToVotesController < ApplicationController
  before_action :set_dates_to_vote, only: [:show, :edit, :update, :destroy]

  # GET /dates_to_votes
  # GET /dates_to_votes.json
  def index
    @dates_to_votes = DatesToVote.includes(:event,:votes)
  end

  # GET /dates_to_votes/1
  # GET /dates_to_votes/1.json
  def show
  end

  # GET /dates_to_votes/new
  def new
    @dates_to_vote = DatesToVote.new
  end

  # GET /dates_to_votes/1/edit
  def edit
  end

  # POST /dates_to_votes
  # POST /dates_to_votes.json
  def create
    @dates_to_vote = DatesToVote.new(dates_to_vote_params)

    respond_to do |format|
      if @dates_to_vote.save
        format.html { redirect_to @dates_to_vote, notice: 'Dates to vote was successfully created.' }
        format.json { render :show, status: :created, location: @dates_to_vote }
      else
        format.html { render :new }
        format.json { render json: @dates_to_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dates_to_votes/1
  # PATCH/PUT /dates_to_votes/1.json
  def update
    respond_to do |format|
      if @dates_to_vote.update(dates_to_vote_params)
        format.html { redirect_to @dates_to_vote, notice: 'Dates to vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @dates_to_vote }
      else
        format.html { render :edit }
        format.json { render json: @dates_to_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dates_to_votes/1
  # DELETE /dates_to_votes/1.json
  def destroy
    @dates_to_vote.destroy
    respond_to do |format|
      format.html { redirect_to dates_to_votes_url, notice: 'Dates to vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dates_to_vote
      @dates_to_vote = DatesToVote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dates_to_vote_params
      params.fetch(:dates_to_vote, {})
    end
end
