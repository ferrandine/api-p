defmodule Eazip.Clothes.Clothe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothes" do
    field :image, :string
    field :type, :string
    field :label, :string

    timestamps()
  end

  @doc false
  def changeset(clothe, attrs) do
    clothe
    |> cast(attrs, [:image, :type, :label])
    |> validate_required([:image, :type, :label])
    |> unique_constraint(:type)
  end
end
