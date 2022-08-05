defmodule Storel.OrderProductTest do
  use Storel.DataCase

  alias Storel.OrderProduct

  describe "order_products" do
    alias Storel.OrderProduct.OrdersProducts

    import Storel.OrderProductFixtures

    @invalid_attrs %{price: nil, quantity: nil}

    test "list_order_products/0 returns all order_products" do
      orders_products = orders_products_fixture()
      assert OrderProduct.list_order_products() == [orders_products]
    end

    test "get_orders_products!/1 returns the orders_products with given id" do
      orders_products = orders_products_fixture()
      assert OrderProduct.get_orders_products!(orders_products.id) == orders_products
    end

    test "create_orders_products/1 with valid data creates a orders_products" do
      valid_attrs = %{price: "120.5", quantity: 42}

      assert {:ok, %OrdersProducts{} = orders_products} = OrderProduct.create_orders_products(valid_attrs)
      assert orders_products.price == Decimal.new("120.5")
      assert orders_products.quantity == 42
    end

    test "create_orders_products/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OrderProduct.create_orders_products(@invalid_attrs)
    end

    test "update_orders_products/2 with valid data updates the orders_products" do
      orders_products = orders_products_fixture()
      update_attrs = %{price: "456.7", quantity: 43}

      assert {:ok, %OrdersProducts{} = orders_products} = OrderProduct.update_orders_products(orders_products, update_attrs)
      assert orders_products.price == Decimal.new("456.7")
      assert orders_products.quantity == 43
    end

    test "update_orders_products/2 with invalid data returns error changeset" do
      orders_products = orders_products_fixture()
      assert {:error, %Ecto.Changeset{}} = OrderProduct.update_orders_products(orders_products, @invalid_attrs)
      assert orders_products == OrderProduct.get_orders_products!(orders_products.id)
    end

    test "delete_orders_products/1 deletes the orders_products" do
      orders_products = orders_products_fixture()
      assert {:ok, %OrdersProducts{}} = OrderProduct.delete_orders_products(orders_products)
      assert_raise Ecto.NoResultsError, fn -> OrderProduct.get_orders_products!(orders_products.id) end
    end

    test "change_orders_products/1 returns a orders_products changeset" do
      orders_products = orders_products_fixture()
      assert %Ecto.Changeset{} = OrderProduct.change_orders_products(orders_products)
    end
  end
end
