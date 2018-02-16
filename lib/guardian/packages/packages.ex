defmodule Guardian.Packages do
  @moduledoc """
  The Packages context.
  """

  import Ecto.Query, warn: false
  alias Guardian.Repo

  alias Guardian.Packages.Package

  @doc """
  Returns the list of packages.

  ## Examples

      iex> list_packages()
      [%Package{}, ...]

  """
  def list_packages do
    Repo.all(Package)
  end

  @doc """
  Gets a single package.

  Raises `Ecto.NoResultsError` if the Package does not exist.

  ## Examples

      iex> get_package!(123)
      %Package{}

      iex> get_package!(456)
      ** (Ecto.NoResultsError)

  """
  def get_package!(id), do: Repo.get!(Package, id)

  @doc """
  Creates a package.

  ## Examples

      iex> create_package(%{field: value})
      {:ok, %Package{}}

      iex> create_package(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_package(attrs \\ %{}) do
    %Package{}
    |> Package.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a package.

  ## Examples

      iex> update_package(package, %{field: new_value})
      {:ok, %Package{}}

      iex> update_package(package, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_package(%Package{} = package, attrs) do
    package
    |> Package.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Package.

  ## Examples

      iex> delete_package(package)
      {:ok, %Package{}}

      iex> delete_package(package)
      {:error, %Ecto.Changeset{}}

  """
  def delete_package(%Package{} = package) do
    Repo.delete(package)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking package changes.

  ## Examples

      iex> change_package(package)
      %Ecto.Changeset{source: %Package{}}

  """
  def change_package(%Package{} = package) do
    Package.changeset(package, %{})
  end

  alias Guardian.Packages.Build

  @doc """
  Returns the list of package_builds.

  ## Examples

      iex> list_package_builds()
      [%Build{}, ...]

  """
  def list_package_builds do
    Repo.all(Build)
  end

  @doc """
  Gets a single build.

  Raises `Ecto.NoResultsError` if the Build does not exist.

  ## Examples

      iex> get_build!(123)
      %Build{}

      iex> get_build!(456)
      ** (Ecto.NoResultsError)

  """
  def get_build!(id), do: Repo.get!(Build, id)

  @doc """
  Creates a build.

  ## Examples

      iex> create_build(%{field: value})
      {:ok, %Build{}}

      iex> create_build(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_build(attrs \\ %{}) do
    %Build{}
    |> Build.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a build.

  ## Examples

      iex> update_build(build, %{field: new_value})
      {:ok, %Build{}}

      iex> update_build(build, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_build(%Build{} = build, attrs) do
    build
    |> Build.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Build.

  ## Examples

      iex> delete_build(build)
      {:ok, %Build{}}

      iex> delete_build(build)
      {:error, %Ecto.Changeset{}}

  """
  def delete_build(%Build{} = build) do
    Repo.delete(build)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking build changes.

  ## Examples

      iex> change_build(build)
      %Ecto.Changeset{source: %Build{}}

  """
  def change_build(%Build{} = build) do
    Build.changeset(build, %{})
  end

  alias Guardian.Packages.Version

  @doc """
  Returns the list of package_versions.

  ## Examples

      iex> list_package_versions()
      [%Version{}, ...]

  """
  def list_package_versions do
    Repo.all(Version)
  end

  @doc """
  Gets a single version.

  Raises `Ecto.NoResultsError` if the Version does not exist.

  ## Examples

      iex> get_version!(123)
      %Version{}

      iex> get_version!(456)
      ** (Ecto.NoResultsError)

  """
  def get_version!(id), do: Repo.get!(Version, id)

  @doc """
  Creates a version.

  ## Examples

      iex> create_version(%{field: value})
      {:ok, %Version{}}

      iex> create_version(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_version(attrs \\ %{}) do
    %Version{}
    |> Version.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a version.

  ## Examples

      iex> update_version(version, %{field: new_value})
      {:ok, %Version{}}

      iex> update_version(version, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_version(%Version{} = version, attrs) do
    version
    |> Version.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Version.

  ## Examples

      iex> delete_version(version)
      {:ok, %Version{}}

      iex> delete_version(version)
      {:error, %Ecto.Changeset{}}

  """
  def delete_version(%Version{} = version) do
    Repo.delete(version)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking version changes.

  ## Examples

      iex> change_version(version)
      %Ecto.Changeset{source: %Version{}}

  """
  def change_version(%Version{} = version) do
    Version.changeset(version, %{})
  end
end
