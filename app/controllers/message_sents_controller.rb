class MessageSentsController < ApplicationController
  before_action :set_message_sent, only: [:show, :edit, :update, :destroy]

  # GET /message_sents
  # GET /message_sents.json
  def index
    @message_sents = MessageSent.all
  end

  # GET /message_sents/1
  # GET /message_sents/1.json
  def show
  end

  # GET /message_sents/new
  def new
    @message_sent = MessageSent.new
  end

  # GET /message_sents/1/edit
  def edit
  end

  # POST /message_sents
  # POST /message_sents.json
  def create
    @message_sent = MessageSent.new(message_sent_params)

    respond_to do |format|
      if @message_sent.save
        format.html { redirect_to @message_sent, notice: 'Message sent was successfully created.' }
        format.json { render :show, status: :created, location: @message_sent }
      else
        format.html { render :new }
        format.json { render json: @message_sent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_sents/1
  # PATCH/PUT /message_sents/1.json
  def update
    respond_to do |format|
      if @message_sent.update(message_sent_params)
        format.html { redirect_to @message_sent, notice: 'Message sent was successfully updated.' }
        format.json { render :show, status: :ok, location: @message_sent }
      else
        format.html { render :edit }
        format.json { render json: @message_sent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_sents/1
  # DELETE /message_sents/1.json
  def destroy
    @message_sent.destroy
    respond_to do |format|
      format.html { redirect_to message_sents_url, notice: 'Message sent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_sent
      @message_sent = MessageSent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_sent_params
      params.fetch(:message_sent, {})
    end
end
