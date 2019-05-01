defmodule Eazip.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :value_base, :decimal
      add :clothe_id, references(:clothes, on_delete: :delete_all), null: false
      add :alteration_id, references(:alterations, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:services, [:clothe_id])
    create index(:services, [:alteration_id])
    create unique_index(:services, [:clothe_id, :alteration_id])
  end
end
