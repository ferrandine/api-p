defmodule Eazip.Services.Service do
  use Ecto.Schema
  import Ecto.Changeset
  alias Eazip.Clothes.Clothe
  alias Eazip.Alterations.Alteration

  schema "services" do
    field :value_base, :decimal
    belongs_to :clothe, Clothe
    belongs_to :alteration, Alteration

    timestamps()
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:value_base])
    |> validate_required([:value_base])
    |> unique_constraint(:clothe, name: :service_clothe_id_alteration_id_index)
  end
end
