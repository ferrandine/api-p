defmodule Eazip.Repo.Migrations.AlterUsersAddTypeField do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :type, :integer, null: false
    end

    create index(:users, [:type])
  end
end
