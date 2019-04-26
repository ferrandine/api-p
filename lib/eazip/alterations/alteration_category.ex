defmodule Eazip.Alterations.AlterationCategory do
  use Ecto.Schema
  import Ecto.Changeset
  alias Eazip.Alterations.Alteration

  schema "alteration_categories" do
    field :type, :string
    has_many :alterations, Alteration, foreign_key: :category_id

    timestamps()
  end

  @doc false
  def changeset(alteration_category, attrs) do
    alteration_category
    |> cast(attrs, [:type])
    |> validate_required([:type])
    |> unique_constraint(:type)
  end
end
