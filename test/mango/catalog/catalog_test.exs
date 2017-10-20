defmodule Mango.CatalogTest do
  use Mango.DataCase

  alias Mango.{Catalog, Repo}
  alias Mango.Catalog.Product

  setup do
    Repo.insert %Product{ name: "Apple", price: 50, sku: "Z42", is_seasonal: true, category: "fruits" }
    Repo.insert %Product{ name: "Tomato", price: 100, sku: "A123", is_seasonal: false, category: "vegetables" }

    :ok
  end

  test "list_products/0 returns all products" do
    [p1 = %Product{}, p2 = %Product{}] = Catalog.list_products

    assert p1.name == "Apple"
    assert p2.name == "Tomato"
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
