defmodule Eazip.Repo.Migrations.AlterUsersAddLocationFields do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :country, :string
      add :city, :string
      add :post_code, :string
      add :street, :string
    end
  end
end
