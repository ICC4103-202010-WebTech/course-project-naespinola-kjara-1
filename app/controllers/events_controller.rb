class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.includes(:user).where("events.user_id= #{current_user.id} ")
    @events1 = Event.includes(:user).where("events.include_organization=true")


  end

  # GET /events/1
  # GET /events/1.json
  def show

    @event_guests = Guest.includes(:user, :event).where("guests.event_id= #{params[:id]}")
    @event_dates_to_votes = DatesToVote.joins(:event).where("dates_to_votes.event_id = #{params[:id]}")
    @event_comments = Comment.joins(:event,:user).where("comments.event_id =#{params[:id]}")
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.dates_to_votes.build
    @event.guests.build
    @event.comments.build


  end

  # GET /events/1/edit
  def edit
  end


  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    puts(@event)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @guests = Guest.where(event_id: @event.id)
    @guests.each do |guest|
     guest.destroy
    end
    @dates_to_votes = DatesToVote.where(event_id: @event.id)
    @dates_to_votes.each do  |dates_to_vote|
      dates_to_vote.destroy
    end
    @reports = Report.where(event_id: @event.id)
    @reports.each do  |report|
      report.destroy
    end
    @comments = Comment.where(event_id: @event.id)
    @comments.each do  |comment|
      comment.destroy
    end
    @event.destroy

    #respond_to do |format|
    #  format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
    # format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.fetch(:event, {}).permit(:title, :description, :private, :include_organization, :image,
                                      :videos, :documents, :location, :user_id,:pictures,
                                      users_attributes: [:organization_id, :username, :email, :password, :is_organization_admin,
                                                         :is_system_admin, :in_blacklist],
                                       comments_attributes: [:id,:user_id, :rich_text,:image],
                                       guests_attributes: [:id,:user_id, :_destroy],
                                       dates_to_votes_attributes: [:id, :date, :_destroy])
    end
end
