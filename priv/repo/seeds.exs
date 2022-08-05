# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Storel.Repo.insert!(%Storel.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

customer = %{email: "AbcDsjdasdf", first_name: "1234", lastname: "1234", password: "123456, password_confirmation: "123456"}
customer
|> Storel.Customers.create_customer()


playstation = %{name: "playstation", price: 3000, quantity: 300}
xbox = %{name: "xbox", price: 4800, quantity: 100}

playstation
|> Storel.Products.create_product()

xbox
|> Storel.Products.create_product()