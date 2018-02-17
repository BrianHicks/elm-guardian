defmodule GuardianWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Ecto, repo: Guardian.Repo

  alias GuardianWeb.Resolvers

  # TODO: dataloader for associations https://hexdocs.pm/absinthe/ecto.html#dataloader
  # apparently the approach below is deprecated, despite being recommended in the
  # docs. <_<

  import_types(Absinthe.Type.Custom)

  object :package do
    field(:name, non_null(:string))
    field(:source, non_null(:string))

    field(
      :versions,
      non_null(list_of(non_null(:version))),
      resolve: assoc(:versions)
    )

    field(
      :builds,
      non_null(list_of(non_null(:build))),
      resolve: assoc(:builds)
    )

    field(:inserted_at, non_null(:datetime))
    field(:updated_at, non_null(:datetime))
  end

  object :version do
    # TODO: make these together a fancy scalar
    field(:major, non_null(:integer))
    field(:minor, non_null(:integer))
    field(:patch, non_null(:integer))
    # TODO: make an enum
    field(:compiler, non_null(:string))
    field(:build, :build, resolve: assoc(:build))

    field(:inserted_at, non_null(:datetime))
    field(:updated_at, non_null(:datetime))
  end

  object :build do
    field(:version, :version, resolve: assoc(:version))

    field(:inserted_at, non_null(:datetime))
    field(:updated_at, non_null(:datetime))
  end

  query do
    field :packages, non_null(list_of(non_null(:package))) do
      resolve(&Resolvers.Package.list/3)
    end
  end
end
