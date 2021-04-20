defmodule Inmana do
  alias Inmana.Restaurants.Create

  defdelegate create_restautante(params), to: Create, as: :call
end
