defmodule Eazip.Alterations.Alteration do
  use Ecto.Schema
  import Ecto.Changeset
  alias Eazip.Alterations.AlterationCategory

  schema "alterations" do
    field :description, :string
    field :label, :string
    field :image, :string
    field :type, :string
    belongs_to :alteration_category, AlterationCategory, foreign_key: :category_id

    timestamps()
  end

  @doc false
  def changeset(alteration, attrs) do
    alteration
    |> cast(attrs, [:type, :description, :image, :label])
    |> validate_required([:type, :description, :image, :label])
    |> unique_constraint(:type, name: :alteration_category_id_type_index)
  end
end
