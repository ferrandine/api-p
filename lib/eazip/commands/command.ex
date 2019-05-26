defmodule Eazip.Commands.Command do
  use Ecto.Schema
  import Ecto.Changeset
  alias Eazip.Accounts.User
  alias Eazip.Services.Service

  schema "commands" do
    field :status, :string
    field :appointment_at, :utc_datetime
    belongs_to :customer, User, foreign_key: :customer_id
    belongs_to :sewer, User, foreign_key: :sewer_id
    many_to_many :services, Service, join_through: "command_services"

    timestamps()
  end

  @doc false
  def changeset(command, attrs) do
    command
    |> cast(attrs, [:status, :customer_id, :sewer_id, :appointment_at])
    |> validate_required([:customer_id, :sewer_id, :appointment_at])
    |> foreign_key_constraint(:customer_id)
    |> foreign_key_constraint(:sewer_id)
  end
end
