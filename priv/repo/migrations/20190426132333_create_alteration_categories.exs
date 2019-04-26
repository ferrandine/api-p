defmodule Eazip.Repo.Migrations.CreateAlterationCategories do
  use Ecto.Migration

  def change do
    create table(:alteration_categories) do
      add :type, :string

      timestamps()
    end

    create unique_index(:alteration_categories, [:type])
  end
end
