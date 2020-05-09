class RepliesToCommentsController < ApplicationController
  before_action :set_replies_to_comment, only: [:show, :edit, :update, :destroy]

  # GET /replies_to_comments
  # GET /replies_to_comments.json
  def index
    @replies_to_comments = RepliesToComment.all
  end

  # GET /replies_to_comments/1
  # GET /replies_to_comments/1.json
  def show
  end

  # GET /replies_to_comments/new
  def new
    @replies_to_comment = RepliesToComment.new
  end

  # GET /replies_to_comments/1/edit
  def edit
  end

  # POST /replies_to_comments
  # POST /replies_to_comments.json
  def create
    @replies_to_comment = RepliesToComment.new(replies_to_comment_params)

    respond_to do |format|
      if @replies_to_comment.save
        format.html { redirect_to @replies_to_comment, notice: 'Replies to comment was successfully created.' }
        format.json { render :show, status: :created, location: @replies_to_comment }
      else
        format.html { render :new }
        format.json { render json: @replies_to_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replies_to_comments/1
  # PATCH/PUT /replies_to_comments/1.json
  def update
    respond_to do |format|
      if @replies_to_comment.update(replies_to_comment_params)
        format.html { redirect_to @replies_to_comment, notice: 'Replies to comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @replies_to_comment }
      else
        format.html { render :edit }
        format.json { render json: @replies_to_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies_to_comments/1
  # DELETE /replies_to_comments/1.json
  def destroy
    @replies_to_comment.destroy
    respond_to do |format|
      format.html { redirect_to replies_to_comments_url, notice: 'Replies to comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_replies_to_comment
      @replies_to_comment = RepliesToComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def replies_to_comment_params
      params.fetch(:replies_to_comment, {})
    end
end
