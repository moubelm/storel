defmodule Storel.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Storel.Products` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        name: "some name",
        price: "120.5",
        quantity: 42
      })
      |> Storel.Products.create_product()

    product
  end
end
