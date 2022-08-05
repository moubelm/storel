defmodule Storel.OrderProduct do
  @moduledoc """
  The OrderProduct context.
  """

  import Ecto.Query, warn: false
  alias Storel.Repo

  alias Storel.OrderProduct.OrdersProducts

  @doc """
  Returns the list of order_products.

  ## Examples

      iex> list_order_products()
      [%OrdersProducts{}, ...]

  """
  def list_order_products do
    Repo.all(OrdersProducts)
  end

  @doc """
  Gets a single orders_products.

  Raises `Ecto.NoResultsError` if the Orders products does not exist.

  ## Examples

      iex> get_orders_products!(123)
      %OrdersProducts{}

      iex> get_orders_products!(456)
      ** (Ecto.NoResultsError)

  """
  def get_orders_products!(id), do: Repo.get!(OrdersProducts, id)

  @doc """
  Creates a orders_products.

  ## Examples

      iex> create_orders_products(%{field: value})
      {:ok, %OrdersProducts{}}

      iex> create_orders_products(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_orders_products(attrs \\ %{}) do
    %OrdersProducts{}
    |> OrdersProducts.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a orders_products.

  ## Examples

      iex> update_orders_products(orders_products, %{field: new_value})
      {:ok, %OrdersProducts{}}

      iex> update_orders_products(orders_products, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_orders_products(%OrdersProducts{} = orders_products, attrs) do
    orders_products
    |> OrdersProducts.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a orders_products.

  ## Examples

      iex> delete_orders_products(orders_products)
      {:ok, %OrdersProducts{}}

      iex> delete_orders_products(orders_products)
      {:error, %Ecto.Changeset{}}

  """
  def delete_orders_products(%OrdersProducts{} = orders_products) do
    Repo.delete(orders_products)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking orders_products changes.

  ## Examples

      iex> change_orders_products(orders_products)
      %Ecto.Changeset{data: %OrdersProducts{}}

  """
  def change_orders_products(%OrdersProducts{} = orders_products, attrs \\ %{}) do
    OrdersProducts.changeset(orders_products, attrs)
  end
end
