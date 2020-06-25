class MessagesController < ApplicationController
  #before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_message, except: [:index]
  before_action :check_participating!, except: [:index]


  # GET /messages
  # GET /messages.json
  def index
    #id_user = current_person.id
    #message = Message.includes(:user_receiver,:user_transmitter).where("messages.user_receiver_id=#{id_user}")
    #@transmitter= Message.includes(:user_receiver,:user_transmitter).where("messages.user_receiver_id=#{id_user}").select(:user_transmitter)
#
    #@messageList = []
    #message.each do |i|
    #  receiverName = User.find_by(id: i.user_receiver_id).username
    #  transmitterName = User.find_by(id: i.user_transmitter_id).username
    #  @messageList <<{received: receiverName, transmitter:transmitterName, text: i.text_message}
    #end

    @messages = Message.participating(current_person).order("updated_at DESC")
    @current = current_person

  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @personal_message = PersonalMessage.new
  end

  # GET /messages/new
  def new
    #@message = Message.new
    redirect_to message_path(@message) and return if @message
    @personal_message = current_person.personal_messages.build
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    #@message = Message.new(message_params)
    #@post = current_user.posts.new(params[:post])
    @message = current_person.transmitted_messages.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
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
      #@message = Message.find(params[:id])
      #@message = Message.where(id: params[:id])
      @mesage = Message.find_by(id: params[:id])
    end

    def check_participating!
      redirect_to root_path unless @message && @message.participates?(current_person)
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.fetch(:message, {})
    end

    def find_conversation!
      if params[:user_receiver_id]
        @receiver = User.find_by(id: params[:user_receiver_id])
        redirect_to(root_path) and return unless @receiver
        @conversation = Message.between(current_person.id, @receiver.id)[0]
      else
        @conversation = Message.find_by(id: params[:message_id])
        redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_person)
      end
    end
end
