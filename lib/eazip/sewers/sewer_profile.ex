defmodule Eazip.Sewers.SewerProfile do
  use Ecto.Schema
  import Ecto.Changeset
  alias Eazip.Accounts.User

  schema "sewer_profiles" do
    field :description, :string
    field :picture, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(sewer_profile, attrs) do
    sewer_profile
    |> cast(attrs, [:picture, :description, :user_id])
    |> validate_required([:picture, :description, :user_id])
    |> foreign_key_constraint(:user_id)
  end
end
