defmodule Eazip.Repo.Migrations.CreateSewerProfiles do
  use Ecto.Migration

  def change do
    create table(:sewer_profiles) do
      add :picture, :string
      add :description, :string
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:sewer_profiles, [:user_id])
  end
end
