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
end
