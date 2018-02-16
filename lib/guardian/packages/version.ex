defmodule Guardian.Packages.Version do
  use Ecto.Schema
  import Ecto.Changeset
  alias Guardian.Packages.{Package, Build, Version}

  schema "package_versions" do
    field(:compiler, :string)
    field(:major, :integer)
    field(:minor, :integer)
    field(:patch, :integer)
    belongs_to(:package, Package)
    belongs_to(:build, Build)

    timestamps()
  end

  @doc false
  def changeset(%Version{} = version, attrs) do
    version
    |> cast(attrs, [:major, :minor, :patch, :compiler])
    |> validate_required([:major, :minor, :patch, :compiler, :package_id])
  end
end
