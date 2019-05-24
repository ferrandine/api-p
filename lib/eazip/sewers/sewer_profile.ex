defmodule Eazip.Sewers.SewerProfile do
  use Ecto.Schema
  import Ecto.{Changeset, Query}
  alias Eazip.Accounts.User

  schema "sewer_profiles" do
    field :description, :string
    field :picture, :string
    belongs_to :user, User
    field :rating, :integer, virtual: true
    has_many :sewer_reviews, through: [:user, :sewer_reviews]

    timestamps()
  end

  @doc false
  def changeset(sewer_profile, attrs) do
    sewer_profile
    |> cast(attrs, [:picture, :description, :user_id])
    |> validate_required([:picture, :description, :user_id])
    |> foreign_key_constraint(:user_id)
  end

  def get_rating(query) do
    from sp in query,
      left_join: r in assoc(sp, :sewer_reviews),
      select: %{sp | rating: avg(r.rating)},
      group_by: sp.id
  end
end
