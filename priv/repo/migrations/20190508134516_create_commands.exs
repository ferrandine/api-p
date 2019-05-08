defmodule Eazip.Repo.Migrations.CreateCommands do
  use Ecto.Migration

  def change do
    create table(:commands) do
      add :status, :string, null: false, default: "pending"
      add :customer_id, references(:users, on_delete: :nothing), null: false
      add :sewer_id, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:commands, [:customer_id])
    create index(:commands, [:sewer_id])
  end
end
