defmodule Eazip.ClothesTest do
  use Eazip.DataCase

  alias Eazip.Clothes

  describe "clothes" do
    alias Eazip.Clothes.Clothe

    @valid_attrs %{image: "some image", type: "some type"}
    @update_attrs %{image: "some updated image", type: "some updated type"}
    @invalid_attrs %{image: nil, type: nil}

    def clothe_fixture(attrs \\ %{}) do
      {:ok, clothe} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Clothes.create_clothe()

      clothe
    end

    test "list_clothes/0 returns all clothes" do
      clothe = clothe_fixture()
      assert Clothes.list_clothes() == [clothe]
    end

    test "get_clothe!/1 returns the clothe with given id" do
      clothe = clothe_fixture()
      assert Clothes.get_clothe!(clothe.id) == clothe
    end

    test "create_clothe/1 with valid data creates a clothe" do
      assert {:ok, %Clothe{} = clothe} = Clothes.create_clothe(@valid_attrs)
      assert clothe.image == "some image"
      assert clothe.type == "some type"
    end

    test "create_clothe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clothes.create_clothe(@invalid_attrs)
    end

    test "update_clothe/2 with valid data updates the clothe" do
      clothe = clothe_fixture()
      assert {:ok, %Clothe{} = clothe} = Clothes.update_clothe(clothe, @update_attrs)
      assert clothe.image == "some updated image"
      assert clothe.type == "some updated type"
    end

    test "update_clothe/2 with invalid data returns error changeset" do
      clothe = clothe_fixture()
      assert {:error, %Ecto.Changeset{}} = Clothes.update_clothe(clothe, @invalid_attrs)
      assert clothe == Clothes.get_clothe!(clothe.id)
    end

    test "delete_clothe/1 deletes the clothe" do
      clothe = clothe_fixture()
      assert {:ok, %Clothe{}} = Clothes.delete_clothe(clothe)
      assert_raise Ecto.NoResultsError, fn -> Clothes.get_clothe!(clothe.id) end
    end

    test "change_clothe/1 returns a clothe changeset" do
      clothe = clothe_fixture()
      assert %Ecto.Changeset{} = Clothes.change_clothe(clothe)
    end
  end
end
