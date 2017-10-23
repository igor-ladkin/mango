defmodule Mango.Sales do
  alias Mango.Repo
  alias Mango.Sales.Order

  def create_cart do
    %Order{status: "In Cart"} |> Repo.insert!
  end

  def get_cart(id) do
    Order
    |> Repo.get_by(id: id, status: "In Cart")
  end
end
