defmodule Inmana.RestaurantTest do
  use Inmana.DataCase, async: true

  alias Inmana.Restaurant
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Pizzaria Pode Chega", email: "pizzariapodechegar@contato.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{email: "pizzariapodechegar@contato.com", name: "Pizzaria Pode Chega"},
               valid?: true
             } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{name: "P", email: ""}

      expected_response = %{
        name: ["should be at least 2 character(s)"],
        email: ["can't be blank"]
      }

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_response
    end
  end
end
