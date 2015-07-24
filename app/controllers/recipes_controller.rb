class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipe = Recipe.new
    recipe = Recipe.new

    # Display only the current user's recipes
    if current_user.present?
        @recipes = current_user.recipes
    else
        @recipes = Recipe.all
    end
  end

  # GET /recipes/1
  def show  # GET /recipes/1.json
    @recipe = Recipe.find params[:id]

      if current_user.id != @recipe.user_id
        flash[:alert] = "Whoa, whoa, whoa! - Slow up, Home Skillet. You DO NOT have access to that recipe!!"
        redirect_to recipes_path(session[:current_user])
        return
      end
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params) # Build the Recipe
    @recipe.user = current_user # Set manually the user using the current_user method. Keeps tampering with the user field a non issue

    @recipe.is_active = true

    @recipe.save

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  # def destroy
  #   @recipe.destroy
  #   respond_to do |format|
  #     format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  def destroy
      recipe.is_active = false
      # @recipe.destroy

      # @recipe = Recipe.where({ :is_active => "false" })

      respond_to do |format|
        format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed!' }
        format.json { head :no_content }
    end

      @recipe.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :brew_type, :description, :tog, :tfg, :tabv, :taroma, :tibu, :label, :tflavpro, :style_id, :is_active)
    end
end
