defmodule Guardian.PackagesTest do
  use Guardian.DataCase

  alias Guardian.Packages

  describe "packages" do
    alias Guardian.Packages.Package

    @valid_attrs %{name: "some name", source: "some source"}
    @update_attrs %{name: "some updated name", source: "some updated source"}
    @invalid_attrs %{name: nil, source: nil}

    def package_fixture(attrs \\ %{}) do
      {:ok, package} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Packages.create_package()

      package
    end

    test "list_packages/0 returns all packages" do
      package = package_fixture()
      assert Packages.list_packages() == [package]
    end

    test "get_package!/1 returns the package with given id" do
      package = package_fixture()
      assert Packages.get_package!(package.id) == package
    end

    test "create_package/1 with valid data creates a package" do
      assert {:ok, %Package{} = package} = Packages.create_package(@valid_attrs)
      assert package.name == "some name"
      assert package.source == "some source"
    end

    test "create_package/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Packages.create_package(@invalid_attrs)
    end

    test "update_package/2 with valid data updates the package" do
      package = package_fixture()
      assert {:ok, package} = Packages.update_package(package, @update_attrs)
      assert %Package{} = package
      assert package.name == "some updated name"
      assert package.source == "some updated source"
    end

    test "update_package/2 with invalid data returns error changeset" do
      package = package_fixture()
      assert {:error, %Ecto.Changeset{}} = Packages.update_package(package, @invalid_attrs)
      assert package == Packages.get_package!(package.id)
    end

    test "delete_package/1 deletes the package" do
      package = package_fixture()
      assert {:ok, %Package{}} = Packages.delete_package(package)
      assert_raise Ecto.NoResultsError, fn -> Packages.get_package!(package.id) end
    end

    test "change_package/1 returns a package changeset" do
      package = package_fixture()
      assert %Ecto.Changeset{} = Packages.change_package(package)
    end
  end

  describe "package_builds" do
    alias Guardian.Packages.Build

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def build_fixture(attrs \\ %{}) do
      {:ok, build} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Packages.create_build()

      build
    end

    test "list_package_builds/0 returns all package_builds" do
      build = build_fixture()
      assert Packages.list_package_builds() == [build]
    end

    test "get_build!/1 returns the build with given id" do
      build = build_fixture()
      assert Packages.get_build!(build.id) == build
    end

    test "create_build/1 with valid data creates a build" do
      assert {:ok, %Build{} = build} = Packages.create_build(@valid_attrs)
    end

    test "create_build/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Packages.create_build(@invalid_attrs)
    end

    test "update_build/2 with valid data updates the build" do
      build = build_fixture()
      assert {:ok, build} = Packages.update_build(build, @update_attrs)
      assert %Build{} = build
    end

    test "update_build/2 with invalid data returns error changeset" do
      build = build_fixture()
      assert {:error, %Ecto.Changeset{}} = Packages.update_build(build, @invalid_attrs)
      assert build == Packages.get_build!(build.id)
    end

    test "delete_build/1 deletes the build" do
      build = build_fixture()
      assert {:ok, %Build{}} = Packages.delete_build(build)
      assert_raise Ecto.NoResultsError, fn -> Packages.get_build!(build.id) end
    end

    test "change_build/1 returns a build changeset" do
      build = build_fixture()
      assert %Ecto.Changeset{} = Packages.change_build(build)
    end
  end

  describe "package_versions" do
    alias Guardian.Packages.Version

    @valid_attrs %{compiler: "some compiler", major: 42, minor: 42, patch: 42}
    @update_attrs %{compiler: "some updated compiler", major: 43, minor: 43, patch: 43}
    @invalid_attrs %{compiler: nil, major: nil, minor: nil, patch: nil}

    def version_fixture(attrs \\ %{}) do
      {:ok, version} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Packages.create_version()

      version
    end

    test "list_package_versions/0 returns all package_versions" do
      version = version_fixture()
      assert Packages.list_package_versions() == [version]
    end

    test "get_version!/1 returns the version with given id" do
      version = version_fixture()
      assert Packages.get_version!(version.id) == version
    end

    test "create_version/1 with valid data creates a version" do
      assert {:ok, %Version{} = version} = Packages.create_version(@valid_attrs)
      assert version.compiler == "some compiler"
      assert version.major == 42
      assert version.minor == 42
      assert version.patch == 42
    end

    test "create_version/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Packages.create_version(@invalid_attrs)
    end

    test "update_version/2 with valid data updates the version" do
      version = version_fixture()
      assert {:ok, version} = Packages.update_version(version, @update_attrs)
      assert %Version{} = version
      assert version.compiler == "some updated compiler"
      assert version.major == 43
      assert version.minor == 43
      assert version.patch == 43
    end

    test "update_version/2 with invalid data returns error changeset" do
      version = version_fixture()
      assert {:error, %Ecto.Changeset{}} = Packages.update_version(version, @invalid_attrs)
      assert version == Packages.get_version!(version.id)
    end

    test "delete_version/1 deletes the version" do
      version = version_fixture()
      assert {:ok, %Version{}} = Packages.delete_version(version)
      assert_raise Ecto.NoResultsError, fn -> Packages.get_version!(version.id) end
    end

    test "change_version/1 returns a version changeset" do
      version = version_fixture()
      assert %Ecto.Changeset{} = Packages.change_version(version)
    end
  end
end
