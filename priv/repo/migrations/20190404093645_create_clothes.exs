defmodule Eazip.Repo.Migrations.CreateClothes do
  use Ecto.Migration

  def change do
    create table(:clothes) do
      add :image, :string
      add :type, :string
      add :label, :string

      timestamps()
    end

    create unique_index(:clothes, [:type])
  end
end
