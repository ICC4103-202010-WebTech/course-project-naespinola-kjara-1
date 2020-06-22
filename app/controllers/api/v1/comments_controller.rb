class API::V1::CommentsController < APIController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.where(event_id: params[:event_id])
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end


  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.event = Event.find(params[:event_id])

    if @comment.save
      render :show, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end

    #  respond_to do |format|
    # if @comment.save
    #   format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
    #   format.json { render :show, status: :created, location: @comment }
    # else
    #   format.html { render :new }
    #   format.json { render json: @comment.errors, status: :unprocessable_entity }
    # end
    # end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if @comment.update(comment_params)
      render :show, status: :ok, location: api_v1_event_comment_path(@comment)
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
    # respond_to do |format|
    # if @comment.update(comment_params)
    #   format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
    #   format.json { render :show, status: :ok, location: @comment }
    # else
    #   format.html { render :edit }
    #   format.json { render json: @comment.errors, status: :unprocessable_entity }
    # end
    #end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.fetch(:comment, {}).permit(:id,:user_id, :event_id, :rich_text, :image, :title, :description, :private)
    end
end
