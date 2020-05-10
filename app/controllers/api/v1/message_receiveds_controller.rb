class API::V1::MessageReceivedsController < APIController
  before_action :set_message_received, only: [:show, :edit, :update, :destroy]

  # GET /message_receiveds
  # GET /message_receiveds.json
  def index
    @message_receiveds = MessageReceived.all
  end

  # GET /message_receiveds/1
  # GET /message_receiveds/1.json
  def show
  end

  # GET /message_receiveds/new
  def new
    @message_received = MessageReceived.new
  end

  # GET /message_receiveds/1/edit
  def edit
  end

  # POST /message_receiveds
  # POST /message_receiveds.json
  def create
    @message_received = MessageReceived.new(message_received_params)

    respond_to do |format|
      if @message_received.save
        format.html { redirect_to @message_received, notice: 'Message received was successfully created.' }
        format.json { render :show, status: :created, location: @message_received }
      else
        format.html { render :new }
        format.json { render json: @message_received.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_receiveds/1
  # PATCH/PUT /message_receiveds/1.json
  def update
    respond_to do |format|
      if @message_received.update(message_received_params)
        format.html { redirect_to @message_received, notice: 'Message received was successfully updated.' }
        format.json { render :show, status: :ok, location: @message_received }
      else
        format.html { render :edit }
        format.json { render json: @message_received.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_receiveds/1
  # DELETE /message_receiveds/1.json
  def destroy
    @message_received.destroy
    respond_to do |format|
      format.html { redirect_to message_receiveds_url, notice: 'Message received was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_received
      @message_received = MessageReceived.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_received_params
      params.fetch(:message_received, {})
    end
end
