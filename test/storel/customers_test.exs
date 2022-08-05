defmodule Storel.CustomersTest do
  use Storel.DataCase

  alias Storel.Customers

  describe "customers" do
    alias Storel.Customers.Customer

    import Storel.CustomersFixtures

    @invalid_attrs %{email: nil, first_name: nil, lastname: nil, password_hash: nil, role: nil}

    test "list_customers/0 returns all customers" do
      customer = customer_fixture()
      assert Customers.list_customers() == [customer]
    end

    test "get_customer!/1 returns the customer with given id" do
      customer = customer_fixture()
      assert Customers.get_customer!(customer.id) == customer
    end

    test "create_customer/1 with valid data creates a customer" do
      valid_attrs = %{email: "some email", first_name: "some first_name", lastname: "some lastname", password_hash: "some password_hash", role: "some role"}

      assert {:ok, %Customer{} = customer} = Customers.create_customer(valid_attrs)
      assert customer.email == "some email"
      assert customer.first_name == "some first_name"
      assert customer.lastname == "some lastname"
      assert customer.password_hash == "some password_hash"
      assert customer.role == "some role"
    end

    test "create_customer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Customers.create_customer(@invalid_attrs)
    end

    test "update_customer/2 with valid data updates the customer" do
      customer = customer_fixture()
      update_attrs = %{email: "some updated email", first_name: "some updated first_name", lastname: "some updated lastname", password_hash: "some updated password_hash", role: "some updated role"}

      assert {:ok, %Customer{} = customer} = Customers.update_customer(customer, update_attrs)
      assert customer.email == "some updated email"
      assert customer.first_name == "some updated first_name"
      assert customer.lastname == "some updated lastname"
      assert customer.password_hash == "some updated password_hash"
      assert customer.role == "some updated role"
    end

    test "update_customer/2 with invalid data returns error changeset" do
      customer = customer_fixture()
      assert {:error, %Ecto.Changeset{}} = Customers.update_customer(customer, @invalid_attrs)
      assert customer == Customers.get_customer!(customer.id)
    end

    test "delete_customer/1 deletes the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{}} = Customers.delete_customer(customer)
      assert_raise Ecto.NoResultsError, fn -> Customers.get_customer!(customer.id) end
    end

    test "change_customer/1 returns a customer changeset" do
      customer = customer_fixture()
      assert %Ecto.Changeset{} = Customers.change_customer(customer)
    end
  end
end
