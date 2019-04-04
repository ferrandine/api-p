defmodule Eazip.Repo.Migrations.CreateAlterations do
  use Ecto.Migration

  def change do
    create table(:alterations) do
      add :type, :string
      add :description, :text
      add :image, :string

      timestamps()
    end

    create unique_index(:alterations, [:type])
  end
end
