class BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :edit, :update, :destroy]

  # GET /batches
  # GET /batches.json
  def index
    @batch = Batch.new

  # Display only the current user's batches
    if current_user.present?
        @batches = current_user.batches
      else
      @batches = Batch.all
    end
  end

  # This action creates the unique IDs and displays them on the Uniques Index page
  # def generate_uniques
  #   params[:unique_num].to_i.times do Unique.create(batch_id: params[:id], user_id: params[:id], rand_num: rand(1000000))
  #   end

  #   redirect_to uniques_url(@unique), notice: "Your unique numbers are listed below :-]"
  # end

    # This action creates the uni IDs and displays them on the Uni Index page
  def generate_unis
    if params[:uni_num] > '2'
      # params[:uni_num].to_i.times do Uni.create(batch_id: params[:id], user_id: (current_user.id), rand_num: rand(1000000))
      redirect_to :back, notice: "You can only generate 2 numbers at a time!"
    elsif

      params[:uni_num].to_i.times do Uni.create(batch_id: params[:id], user_id: (current_user.id), rand_num: rand(1000000))
    end

    # redirect_to unis_url(@uni), notice: "Your uni numbers are listed below ;)"
    redirect_to :back, notice: "Your unique numbers are listed below :-]"
    end

  end



  # def new_review
  #   Review.create(batch_id: params[:id], headline: params[:headline], content: params[:content], overall_rating: params[:overall_rating], user_id: params[:user_id] )

  #   # @review = Review.new
  #   # @review.headline = params[:headline]
  #   # @review.content = params[:content]
  #   # @review.overall_rating = params[:overall_rating]
  #   # @review.user_id = [:user_id]
  #   # @review.batch_id = params[:batch_id]

  #   # @review.save
  #   redirect_to reviews_url(@review), notice: "Your review has been saved below."
  # end

  # def post_new_review
  #   params[:headline, :content, :overall_rating ] do Review.create(batch_id: params[:id])
  #   end
  # end

  # GET /batches/1
  # GET /batches/1.json
  def show
    if current_user.present?
      @unis = current_user.unis
        else
      @unis = Uni.all
    end
  end

  # GET /batches/new
  def new
    @batch = Batch.new(recipe_id: params[:recipe_id])
  end

  # GET /batches/1/edit
  def edit
  end

  # POST /batches
  # POST /batches.json
  def create
    @batch = Batch.new(batch_params)
    @batch.user = current_user

    respond_to do |format|
      if @batch.save
        format.html { redirect_to @batch, notice: 'Batch was successfully created.' }
        format.json { render :show, status: :created, location: @batch }
        else
        format.html { render :new }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batches/1
  # PATCH/PUT /batches/1.json
  def update
    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to @batch, notice: 'Batch was successfully updated.' }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1
  # DELETE /batches/1.json
  def destroy
    @batch.destroy
    respond_to do |format|
      format.html { redirect_to batches_url, notice: 'Batch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = Batch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_params
      params.require(:batch).permit(:size, :brew_date, :bottle_date, :aog, :afg, :aabv, :aaroma, :aibu, :image, :aflavpro, :recipe_id)
    end
end
