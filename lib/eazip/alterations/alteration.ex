defmodule Eazip.Alterations.Alteration do
  use Ecto.Schema
  import Ecto.Changeset
  alias Eazip.Alterations.AlterationCategory

  schema "alterations" do
    field :description, :string
    field :image, :string
    field :type, :string
    belongs_to :alteration_category, AlterationCategory

    timestamps()
  end

  @doc false
  def changeset(alteration, attrs) do
    alteration
    |> cast(attrs, [:type, :description, :image])
    |> validate_required([:type, :description, :image])
    |> unique_constraint(:type)
  end
end
