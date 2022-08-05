defmodule Storel.Customers.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "customers" do
    field :email, :string
    field :first_name, :string
    field :lastname, :string
    field :password, :string, virtual: true 
    field :password_confirmation, :string, virtual: true 
    field :password_hash, :string
    field :role, :string, default: "user"

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:email, :first_name, :lastname, :password, :password_confirmation, :role])
    |> validate_required([:email, :first_name, :lastname, :password, :password_confirmation, :role])
    |> unique_constraint(:email, message: "Existe un usuario con ese e-mail")
    |> update_change(:email, &String.downcase/1)
    |> validate_format(:email, ~r/@/, message: "Digite un email valido")
    |> validate_length(:password, 
    min: 6, 
    max: 100, 
    message: "pasword tiene que tener entre 6 y 100 caracteres"
    )
    |> validate_confirmation(:password, message: "pasword no es igual")
    |> hashing()
  end

  defp hashing(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp hashing(changeset), do: changeset
end
