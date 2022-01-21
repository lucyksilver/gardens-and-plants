Rails.application.routes.draw do
  resources :gardens do
    # plants is nested because we need access to the gardens id
    # plants belong to gardens, so a plant needs a garden's id to be created
    # this nested route gives us 'gardens/:garden_id/plants'
    # this then gives us access to the garden's id in the params, so we know which garden this plant belongs to
    resources :plants, only: :create
  end
end
