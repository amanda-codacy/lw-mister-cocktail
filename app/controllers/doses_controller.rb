class DosesController < ApplicationController
  def new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    # load an ingredient from the ingredient in the params
    # load a cocktail from the cocktail id in the params
    # assign the dose cocktail
    # assign the dose ingredient
    # assign the dose description
    # save the dose
    # error handling

    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(dose_params[:ingredient_id])
    
    @dose = Dose.new(
      desc: dose_params[:desc],
      ingredient: @ingredient,
      cocktail: @cocktail,
    )

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @ingredients = Ingredient.all
      
      render :new
    end

  end

  def destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:desc, :ingredient_id)
  end
end
