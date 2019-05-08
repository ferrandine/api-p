defmodule Eazip.Services.Service do
  use Ecto.Schema
  import Ecto.Changeset
  alias Eazip.Clothes.Clothe
  alias Eazip.Alterations.Alteration
  alias Eazip.Commands.Command

  schema "services" do
    field :value_base, :decimal
    belongs_to :clothe, Clothe
    belongs_to :alteration, Alteration
    many_to_many :commands, Command, join_through: "command_services"

    timestamps()
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:value_base, :clothe_id, :alteration_id])
    |> validate_required([:value_base, :clothe_id, :alteration_id])
    |> unique_constraint(:clothe, name: :service_clothe_id_alteration_id_index)
    |> foreign_key_constraint(:clothe_id)
    |> foreign_key_constraint(:alteration_id)
  end
end
