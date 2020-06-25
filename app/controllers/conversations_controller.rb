class ConversationsController < ApplicationController
  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]


  # GET /conversations
  # GET /conversations.json
  def index
    #@conversations = Conversation.all
    @conversations = Conversation.participating(current_person).order('updated_at DESC')
    @current_person = current_person
  end

  def with(current_user)
    author == current_user ? receiver : author
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
    @personal_message = PersonalMessage.new
  end

  # GET /conversations/new
  def new
    #@conversation = Conversation.new
    redirect_to conversation_path(@conversation) and return if @conversation
    @personal_message = current_person.personal_messages.build
  end

  # GET /conversations/1/edit
  def edit
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = Conversation.new(conversation_params)

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find_by(id: params[:id])
    end

    def check_participating!
      redirect_to root_path unless @conversation && @conversation.participates?(current_person)
    end

    # Only allow a list of trusted parameters through.
    def conversation_params
      params.fetch(:conversation, {})
    end

    def find_conversation!
      if params[:receiver_id]
        @receiver = User.find_by(id: params[:receiver_id])
        redirect_to(root_path) and return unless @receiver
        @conversation = Conversation.between(current_person.id, @receiver.id)[0]
      else
        @conversation = Conversation.find_by(id: params[:conversation_id])
        redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_person)
      end
    end
end
