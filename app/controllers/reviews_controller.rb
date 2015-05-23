class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
  # Display the current user's reviews
   # if current_user.present?
   #    @reviews = current_user.reviews
   #  else
   #    @reviews = Review.all
   # end
   @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find(params[:id])
  end

  # GET /reviews/new
  def new_review
    Review.create(batch_id: params[:id], headline: params[:headline], content: params[:content], overall_rating: params[:overall_rating], user_id: params[:user_id] )

    # @review = Review.new
    # @review.headline = params[:headline]
    # @review.content = params[:content]
    # @review.overall_rating = params[:overall_rating]
    # @review.user_id = [:user_id]
    # @review.batch_id = params[:batch_id]

    # @review.save
    redirect_to reviews_url(@review), notice: "Your review has been saved below."
  end

  def new
    # @review = Review.new(batch_id: params[:batch_id])
    @review = Review.new(batch_id: params[:batch_id])
  end


  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Your review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
        else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
        else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:headline, :content, :overall_rating, :batch_id )
    end
end
