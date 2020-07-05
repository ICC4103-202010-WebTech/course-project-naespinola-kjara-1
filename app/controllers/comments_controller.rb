class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  # load_and_authorize_resource
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all.joins(:event,:user)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @event = Event.find(params[:event_id])
    #  @user = User.find(params[:user_id])
    @comment = @event.comments.new(comment_params)
    if user_signed_in?
      @comment.user = current_person
    end

  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.new(comment_params)
    #@comment = current_person.comments.new(comment_params)
    if user_signed_in?
      @comment.user = current_person
    end

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @event, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @event = @comment.event
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @event, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @event = @comment.event
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @event, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.fetch(:comment, {}).permit(:user_id,:event_id, :rich_text, images: [],
                                        users_attributes: [:username, :email, :password,
                                                          :in_blacklist])
    end
end
