defmodule Eazip.Commands.CommandService do
  use Ecto.Schema
  import Ecto.Changeset
  alias Eazip.Commands.Command
  alias Eazip.Services.Service

  schema "command_services" do
    belongs_to :command, Command
    belongs_to :service, Service

    timestamps()
  end

  @doc false
  def changeset(command_service, attrs) do
    command_service
    |> cast(attrs, [:command_id, :service_id])
    |> validate_required([:command_id, :service_id])
    |> foreign_key_constraint(:command_id)
    |> foreign_key_constraint(:service_id)
  end
end
