class API::V1::EventsController < APIController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    if @event.save
      render :show, status: :created, location: api_v1_events_path(@event)
    else
      render json: @event.errors, status: :unprocessable_entity
    end

    #respond_to do |format|
    #  if @event.save
    #    format.html { redirect_to @event, notice: 'Event was successfully created.' }
    #    format.json { render :show, status: :created, location: @event }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @event.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    # respond_to do |format|
    if @event.update(event_params)
      render :show, status: :ok, location: api_v1_events_path(@event)
      # format.html { redirect_to @event, notice: 'Event was successfully updated.' }
      #format.json { render :show, status: :ok, location: @event }
    else
      render json: @event.errors, status: :unprocessable_entity
      #format.html { render :edit }
      #format.json { render json: @event.errors, status: :unprocessable_entity }
      # end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    head :no_content
    # respond_to do |format|
    # format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
    # format.json { head :no_content }
    # end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.fetch(:event, {}).permit(:title, :description, :private, :image, :organization_id,
                                      :location, :user_id, videos: [], documents: [], pictures: [],
                                      users_attributes: [:username, :email, :password,
                                                         :in_blacklist],
                                      comments_attributes: [:id,:user_id, :rich_text,:image],
                                      guests_attributes: [:id,:user_id, :_destroy],
                                      dates_to_votes_attributes: [:id, :date, :_destroy],
                                      organizations_attributes: [:name, :image, :rich_text, :description])
    end
end
