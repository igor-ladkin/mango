defmodule Mango.CatalogTest do
  use ExUnit.Case
  alias Mango.Catalog
  alias Mango.Catalog.Product

  test "list_products/0 returns all products" do
    [p1 = %Product{}, p2 = %Product{}] = Catalog.list_products

    assert p1.name == "Apple"
    assert p1.price == 50
    assert p2.name == "Tomato"
    assert p2.price == 100
  end

  test "list_seasonal_products/0 returns only seasonal products" do
    [p1 = %Product{}] = Catalog.list_seasonal_products

    assert p1.name == "Apple"
  end

  test "get_category_products/1 returns products of given category" do
    [p1 = %Product{}] = Catalog.get_category_products("fruits")

    assert p1.name == "Apple"
  end
end
