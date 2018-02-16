defmodule GuardianWeb.Schema do
  use Absinthe.Schema

  alias Guardian.Packages.{Package}
  alias GuardianWeb.Resolvers

  object :package do
    field :name, non_null(:string)
    field :source, non_null(:string)
  end

  query do
    field :all_packages, non_null(list_of(non_null(:package))) do
      resolve &Resolvers.Package.all_packages/3
    end
  end
end
