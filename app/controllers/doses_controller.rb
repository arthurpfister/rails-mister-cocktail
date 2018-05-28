class DosesController < ApplicationController
before_action :set_cocktail, only: [:new, :create, :destroy]
before_action :set_dose, only: [:destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'cocktails/show' }
        format.js
      end
    end
  end

  def destroy
    @dose.destroy

    respond_to do |format|
      format.html { redirect_to cocktail_path(@cocktail), notice: "Ingredient was succesfully removed." }
      format.js { }
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
