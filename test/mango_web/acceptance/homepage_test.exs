defmodule MangoWeb.HomepageTest do
  use Mango.DataCase
  use Hound.Helpers

  alias Mango.Repo
  alias Mango.Catalog.Product

  hound_session()

  setup do
    Repo.insert %Product{ name: "Apple", price: 50, sku: "Z42", is_seasonal: true, category: "fruits" }
    Repo.insert %Product{ name: "Tomato", price: 100, sku: "A123", is_seasonal: false, category: "vegetables" }

    :ok
  end

  test "presence of seasonal products" do
    ## GIVEN ##
    # There are two products Apple and Tomato priced at 100 and 50 respectively
    # With Apple being the only seasonal product

    ## WHEN ##
    navigate_to("/")

    ## THEN ##
    page_title = find_element(:css, ".page-title") |> visible_text()
    assert page_title == "Seasonal products"

    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |> visible_text()
    product_price = find_within_element(product, :css, ".product-price") |> visible_text()

    assert product_name == "Apple"
    assert product_price == "50"

    refute page_source() =~ "Tomato"
  end
end
