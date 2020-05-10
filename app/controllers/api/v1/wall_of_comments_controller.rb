class API::V1::WallOfCommentsController < APIController
  before_action :set_wall_of_comment, only: [:show, :edit, :update, :destroy]

  # GET /wall_of_comments
  # GET /wall_of_comments.json
  def index
    @wall_of_comments = WallOfComment.all
  end

  # GET /wall_of_comments/1
  # GET /wall_of_comments/1.json
  def show
  end

  # GET /wall_of_comments/new
  def new
    @wall_of_comment = WallOfComment.new
  end

  # GET /wall_of_comments/1/edit
  def edit
  end

  # POST /wall_of_comments
  # POST /wall_of_comments.json
  def create
    @wall_of_comment = WallOfComment.new(wall_of_comment_params)

    respond_to do |format|
      if @wall_of_comment.save
        format.html { redirect_to @wall_of_comment, notice: 'Wall of comment was successfully created.' }
        format.json { render :show, status: :created, location: @wall_of_comment }
      else
        format.html { render :new }
        format.json { render json: @wall_of_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wall_of_comments/1
  # PATCH/PUT /wall_of_comments/1.json
  def update
    respond_to do |format|
      if @wall_of_comment.update(wall_of_comment_params)
        format.html { redirect_to @wall_of_comment, notice: 'Wall of comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @wall_of_comment }
      else
        format.html { render :edit }
        format.json { render json: @wall_of_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wall_of_comments/1
  # DELETE /wall_of_comments/1.json
  def destroy
    @wall_of_comment.destroy
    respond_to do |format|
      format.html { redirect_to wall_of_comments_url, notice: 'Wall of comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wall_of_comment
      @wall_of_comment = WallOfComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wall_of_comment_params
      params.fetch(:wall_of_comment, {})
    end
end
