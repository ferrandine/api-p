defmodule Eazip.Repo.Migrations.CreateCommandServices do
  use Ecto.Migration

  def change do
    create table(:command_services) do
      add :command_id, references(:commands, on_delete: :delete_all), null: false
      add :service_id, references(:services, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:command_services, [:command_id])
    create index(:command_services, [:service_id])
  end
end
