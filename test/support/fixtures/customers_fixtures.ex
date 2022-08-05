defmodule Storel.CustomersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Storel.Customers` context.
  """

  @doc """
  Generate a customer.
  """
  def customer_fixture(attrs \\ %{}) do
    {:ok, customer} =
      attrs
      |> Enum.into(%{
        email: "some email",
        first_name: "some first_name",
        lastname: "some lastname",
        password_hash: "some password_hash",
        role: "some role"
      })
      |> Storel.Customers.create_customer()

    customer
  end
end
