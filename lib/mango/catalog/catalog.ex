defmodule Mango.Catalog do
  alias Mango.Catalog.Product

  def list_products do
    apple = %Product{name: "Apple", price: 50, is_seasonal: true, category: "fruits"}
    tomato = %Product{name: "Tomato", price: 100, is_seasonal: false, category: "vegetables"}

    [apple, tomato]
  end

  def list_seasonal_products do
    list_products()
    |> Enum.filter(fn(product) -> product.is_seasonal end)
  end

  def get_category_products(category) do
    list_products()
    |> Enum.filter(fn(product) -> product.category == category end)
  end
end
