defmodule Eazip.Reviews.Review do
  use Ecto.Schema
  import Ecto.Changeset
  alias Eazip.Accounts.User
  alias Eazip.Commands.Command

  schema "reviews" do
    field :comment, :string
    field :rating, :integer
    belongs_to :customer, User, foreign_key: :customer_id
    belongs_to :sewer, User, foreign_key: :sewer_id
    belongs_to :command, Command

    timestamps()
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, [:comment, :rating])
    |> validate_required([:comment, :rating])
    |> foreign_key_constraint(:customer_id)
    |> foreign_key_constraint(:sewer_id)
    |> foreign_key_constraint(:command_id)
  end
end
