defmodule Storel.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias Storel.OrderProduct.OrderProduct

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "orders" do

    field :customers_id, :binary_id
    
    belongs_to :customers, Storel.Customers.Customer
    has_many :order_products, OrderProduct

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:customer_id])
    |> foreign_key_cnstraint(:customer_id)
    |> cast_assoc(:order_products, with: &OrdersProduct.changeset/2)
    |> validate_required([:customer_id, :order_products])
  end
end
