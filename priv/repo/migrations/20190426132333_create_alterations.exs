defmodule Eazip.Repo.Migrations.CreateAlterations do
  use Ecto.Migration

  def change do
    create table(:alterations) do
      add :type, :string
      add :description, :text
      add :image, :string
      add :category_id, references(:alteration_categories, on_delete: :delete_all), null: false

      timestamps()
    end

    create unique_index(:alterations, [:category_id, :type])
  end
end
