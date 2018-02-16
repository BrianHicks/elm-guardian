defmodule Guardian.Repo.Migrations.CreatePackageVersions do
  use Ecto.Migration

  def change do
    create table(:package_versions) do
      add :major, :integer
      add :minor, :integer
      add :patch, :integer
      add :compiler, :string
      add :package_id, references(:packages, on_delete: :delete_all), null: false
      add :build_id, references(:package_builds, on_delete: :nothing)

      timestamps()
    end

    create index(:package_versions, [:package_id])
    create index(:package_versions, [:build_id])
  end
end
