defmodule Guardian.Packages.Package do
  use Ecto.Schema
  import Ecto.Changeset
  alias Guardian.Packages.Package


  schema "packages" do
    field :name, :string
    field :source, :string

    timestamps()
  end

  @doc false
  def changeset(%Package{} = package, attrs) do
    package
    |> cast(attrs, [:name, :source])
    |> validate_required([:name, :source])
  end
end
