class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
  # Display the current user's reviews
   if current_user.present?
      @reviews = current_user.reviews
    else
      @reviews = Review.all
   end
   # @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
      @review = Review.find(params[:id])
  end

  # def reviewed
  #   if current_user.present?
  #     @reviews = Review.where( :batch_id => current_user.batches)
  #   else
  #     @reviews = Review.all
  #   end
  # end

  # Adds new review to db
  def new
      @review = Review.new(batch_id: params[:batch_id])

      # @u = Uni.find_by({ :rand_num => params[:new_number] })
      # @u.is_used = true
      # @u.save
  end


  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    # render :text => params.to_s and return

    # params[:batch_id]

    @review = Review.new(review_params)

    @review.user = current_user

    if current_user.id == @review.batch.user_id
        # We should redirect users to a different page. Not @review
        redirect_to @review, notice: 'Hey....Brewers code violation dude! You know you cannot review your own stuff, right?!'
    else

      respond_to do |format|
        if @review.save
          format.html { redirect_to @review, notice: 'Your review was successfully created ;)' }
          format.json { render :show, status: :created, location: @review }
          else
          format.html { render :new }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
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
