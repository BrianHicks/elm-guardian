defmodule Guardian.Repo.Migrations.CreatePackageBuilds do
  use Ecto.Migration

  def change do
    create table(:package_builds) do
      add :package_id, references(:packages, on_delete: :nothing)

      timestamps()
    end

    create index(:package_builds, [:package_id])
  end
end
