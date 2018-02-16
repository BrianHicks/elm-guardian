defmodule Guardian.Packages.Package do
  use Ecto.Schema
  import Ecto.Changeset
  alias Guardian.Packages.{Package, Build, Version}

  schema "packages" do
    field(:name, :string)
    field(:source, :string)
    has_many(:builds, Build)
    has_many(:versions, Version)

    timestamps()
  end

  @doc false
  def changeset(%Package{} = package, attrs) do
    package
    |> cast(attrs, [:name, :source])
    |> validate_required([:name, :source])
  end
end
