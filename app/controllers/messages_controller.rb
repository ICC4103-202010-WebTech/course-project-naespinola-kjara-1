class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]


  # GET /messages
  # GET /messages.json
  def index
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true;
      end
    end
    @current_person = current_person.id
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @current_person = current_person.id
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    #@message = Message.new(message_params)
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.new(message_params)
    @message.conversation = @conversation
    #respond_to do |format|
    #  if @message.save
    #    format.html { redirect_to @message, notice: 'Message was successfully created.' }
    #    format.json { render :show, status: :created, location: @message }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @message.errors, status: :unprocessable_entity }
    #  end
    #end

    if @message.save
      redirect_to conversation_messages_path(@conversation)
    #else
    #  render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.fetch(:message, {}).permit(:body, :user_id,
                                        users_attributes: [:username, :email, :password,
                                                           :in_blacklist])
        #params.require(:message).permit(:body, :user_id)
    end
end
