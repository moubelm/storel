defmodule Storel.OrdersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Storel.Orders` context.
  """

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{

      })
      |> Storel.Orders.create_order()

    order
  end
end
