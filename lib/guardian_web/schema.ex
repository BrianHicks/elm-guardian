defmodule GuardianWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Ecto, repo: Guardian.Repo

  alias GuardianWeb.Resolvers

  object :package do
    field(:name, non_null(:string))
    field(:source, non_null(:string))
    field(
      :versions,
      non_null(list_of(non_null(:version))),
      resolve: assoc(:versions)
    )
  end

  object :version do
    field(:major, non_null(:integer)) # TODO: make these together a fancy scalar
    field(:minor, non_null(:integer))
    field(:patch, non_null(:integer))
    field(:compiler, non_null(:string)) # TODO: make an enum
  end

  query do
    field :packages, non_null(list_of(non_null(:package))) do
      resolve(&Resolvers.Package.list/3)
    end
  end
end
