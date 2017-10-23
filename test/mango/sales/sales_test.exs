defmodule Mango.SalesTest do
  use Mango.DataCase

  alias Mango.{Repo, Sales}
  alias Mango.Sales.Order

  test "create_cart/1 returns a new order with 'In Cart' status" do
    assert %Order{status: "In Cart"} = Sales.create_cart()
  end

  test "get_cart/1 returns cart with a given id" do
    created_cart = Sales.create_cart()
    fetched_cart = Sales.get_cart(created_cart.id)
    assert created_cart.id == fetched_cart.id
  end
end
