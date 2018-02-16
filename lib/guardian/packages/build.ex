defmodule Guardian.Packages.Build do
  use Ecto.Schema
  import Ecto.Changeset
  alias Guardian.Packages.{Package, Build, Version}

  schema "package_builds" do
    belongs_to(:package, Package)
    has_one(:version, Version)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(%Build{} = build, attrs) do
    build
    |> cast(attrs, [])
    |> validate_required([:package_id])
  end
end
