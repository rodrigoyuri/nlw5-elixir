defmodule InmanaWeb.RestaurantsView do
  use InmanaWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      massage: "Resturant created!",
      restaurant: restaurant
    }
  end
end
