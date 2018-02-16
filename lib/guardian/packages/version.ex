defmodule Guardian.Packages.Version do
  use Ecto.Schema
  import Ecto.Changeset
  alias Guardian.Packages.Version


  schema "package_versions" do
    field :compiler, :string
    field :major, :integer
    field :minor, :integer
    field :patch, :integer
    field :package_id, :id
    field :build_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Version{} = version, attrs) do
    version
    |> cast(attrs, [:major, :minor, :patch, :compiler])
    |> validate_required([:major, :minor, :patch, :compiler])
  end
end
