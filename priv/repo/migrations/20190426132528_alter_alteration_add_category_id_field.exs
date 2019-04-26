defmodule Eazip.Repo.Migrations.AlterAlterationAddCategoryIdField do
  use Ecto.Migration

  def change do
    alter table("alterations") do
      add :category_id, references("alteration_categories")
    end
  end
end
