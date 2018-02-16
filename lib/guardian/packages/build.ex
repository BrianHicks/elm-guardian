defmodule Guardian.Packages.Build do
  use Ecto.Schema
  import Ecto.Changeset
  alias Guardian.Packages.Build


  schema "package_builds" do
    field :package_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Build{} = build, attrs) do
    build
    |> cast(attrs, [])
    |> validate_required([])
  end
end
