defmodule Eazip.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :comment, :string
      add :rating, :integer
      add :customer_id, references(:users, on_delete: :nothing), null: false
      add :sewer_id, references(:users, on_delete: :nothing), null: false
      add :command_id, references(:commands, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:reviews, [:customer_id])
    create index(:reviews, [:sewer_id])
    create index(:reviews, [:command_id])
  end
end
