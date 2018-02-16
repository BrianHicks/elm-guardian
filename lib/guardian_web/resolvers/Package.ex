defmodule GuardianWeb.Resolvers.Package do
  alias Guardian.Packages

  def all_packages(_root, _args, _info) do
    {:ok, Packages.list_packages()}
  end
end
