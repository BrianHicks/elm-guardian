defmodule Guardian.Repo.Migrations.CreatePackages do
  use Ecto.Migration

  def change do
    create table(:packages) do
      add :name, :string
      add :source, :string

      timestamps()
    end

  end
end
