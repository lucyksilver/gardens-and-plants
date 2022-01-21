class PlantsController < ApplicationController
  def create
    # Find the information from the form through the plant params
    @plant = Plant.new(plant_params)
    # Find the garden's ID in the params, so we know which garden the plant belongs to
    @garden = Garden.find(params[:garden_id])
    # Make the connection - this plant's garden is the one we found in the params
    @plant.garden = @garden

    if @plant.save
      # if the plant saves then we redirect to the show page of the garden
      redirect_to garden_path(@garden)
    else
      # if it doesn't save, then we render the page where the form is
      # in this case, our form is on the gardens show page
      @plants = @garden.plants
      render 'gardens/show'
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
