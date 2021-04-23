defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{name: "Salgados 1 real", email: "salgados1real@contato.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "massage" => "Resturant created!",
               "restaurant" => %{
                 "email" => "salgados1real@contato.com",
                 "id" => _id,
                 "name" => "Salgados 1 real"
               }
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{email: "salgados1real@contato.com"}

      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
