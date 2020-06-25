class PersonalMessagesController < ApplicationController
  before_action :set_personal_message, only: [:show, :edit, :update, :destroy]
  before_action :find_conversation!

  # GET /personal_messages
  # GET /personal_messages.json
  def index
    @personal_messages = PersonalMessage.all
  end

  # GET /personal_messages/1
  # GET /personal_messages/1.json
  def show
  end

  # GET /personal_messages/new
  def new
    #@personal_message = PersonalMessage.new
    @personal_message = current_person.personal_messages.build
  end

  # GET /personal_messages/1/edit
  def edit
  end

  # POST /personal_messages
  # POST /personal_messages.json
  def create
    #@personal_message = PersonalMessage.new(personal_message_params)
#
    #respond_to do |format|
    #  if @personal_message.save
    #    format.html { redirect_to @personal_message, notice: 'Personal message was successfully created.' }
    #    format.json { render :show, status: :created, location: @personal_message }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @personal_message.errors, status: :unprocessable_entity }
    #  end
    #end

    @conversation ||= Conversation.create(author_id: current_person.id,
                                          receiver_id: @receiver.id)
    @personal_message = current_person.personal_messages.build(personal_message_params)
    @personal_message.conversation_id = @conversation.id
    @personal_message.save!

    flash[:success] = "Your message was sent!"
    redirect_to conversation_path(@conversation)

  end

  # PATCH/PUT /personal_messages/1
  # PATCH/PUT /personal_messages/1.json
  def update
    respond_to do |format|
      if @personal_message.update(personal_message_params)
        format.html { redirect_to @personal_message, notice: 'Personal message was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal_message }
      else
        format.html { render :edit }
        format.json { render json: @personal_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_messages/1
  # DELETE /personal_messages/1.json
  def destroy
    @personal_message.destroy
    respond_to do |format|
      format.html { redirect_to personal_messages_url, notice: 'Personal message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_message
      @personal_message = PersonalMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personal_message_params
      #params.fetch(:personal_message, {})
      params.require(:personal_message).permit(:body)
    end
    def find_conversation!
      @conversation = Conversation.find_by(id: params[:conversation_id])
      redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_person)
    end
end
