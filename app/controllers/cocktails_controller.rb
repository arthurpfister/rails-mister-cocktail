class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy, :chef]

  def index
    @cocktails = Cocktail.all
  end

  # def show
  #   @dose = Dose.find(params[:cocktail_id])
  # end

  def new
    @cocktail = Cocktail.new
  end

  def edit
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def top
    @cocktails = Cocktail.where(stars: 5)
  end

  def destroy
    @cocktail.destroy
    respond_to do |format|
      format.html { redirect_to cocktails_url, notice: 'cocktail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    def cocktail_params
      params.require(:cocktail).permit(:name, :ingredient, :dose)
    end
end

