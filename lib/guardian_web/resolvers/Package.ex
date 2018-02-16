defmodule GuardianWeb.Resolvers.Package do
  alias Guardian.Packages

  def list(_root, _args, _info) do
    {:ok, Packages.list_packages()}
  end
end
