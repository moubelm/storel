defmodule Storel.OrderProductFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Storel.OrderProduct` context.
  """

  @doc """
  Generate a orders_products.
  """
  def orders_products_fixture(attrs \\ %{}) do
    {:ok, orders_products} =
      attrs
      |> Enum.into(%{
        price: "120.5",
        quantity: 42
      })
      |> Storel.OrderProduct.create_orders_products()

    orders_products
  end
end
