defmodule Eazip.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Eazip.Accounts.Credential
  alias Eazip.Reviews.Review

  schema "users" do
    field :birthdate, :date
    field :first_name, :string
    field :last_name, :string
    field :sex, :integer
    field :country, :string
    field :city, :string
    field :post_code, :string
    field :street, :string
    field :type, :integer
    has_one :credential, Credential
    has_many :sewer_reviews, Review, foreign_key: :sewer_id

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :first_name,
      :last_name,
      :sex,
      :birthdate,
      :country,
      :city,
      :post_code,
      :street,
      :type
    ])
    |> validate_required([
      :first_name,
      :last_name,
      :sex,
      :birthdate,
      :country,
      :city,
      :post_code,
      :street,
      :type
    ])
    |> validate_inclusion(:type, 0..2)
  end
end
