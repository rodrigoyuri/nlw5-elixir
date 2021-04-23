defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase, async: true

  import Phoenix.View

  alias InmanaWeb.RestaurantsView
  alias Inmana.Restaurant

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Siri cascudo", email: "siricascudo@contato.com"}
      {:ok, restaurant} = Inmana.create_restautant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               massage: "Resturant created!",
               restaurant: %Restaurant{
                 email: "siricascudo@contato.com",
                 id: _id,
                 name: "Siri cascudo"
               }
             } = response
    end
  end
end
