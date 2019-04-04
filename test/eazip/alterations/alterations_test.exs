defmodule Eazip.AlterationsTest do
  use Eazip.DataCase

  alias Eazip.Alterations

  describe "alterations" do
    alias Eazip.Alterations.Alteration

    @valid_attrs %{description: "some description", image: "some image", type: "some type"}
    @update_attrs %{description: "some updated description", image: "some updated image", type: "some updated type"}
    @invalid_attrs %{description: nil, image: nil, type: nil}

    def alteration_fixture(attrs \\ %{}) do
      {:ok, alteration} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Alterations.create_alteration()

      alteration
    end

    test "list_alterations/0 returns all alterations" do
      alteration = alteration_fixture()
      assert Alterations.list_alterations() == [alteration]
    end

    test "get_alteration!/1 returns the alteration with given id" do
      alteration = alteration_fixture()
      assert Alterations.get_alteration!(alteration.id) == alteration
    end

    test "create_alteration/1 with valid data creates a alteration" do
      assert {:ok, %Alteration{} = alteration} = Alterations.create_alteration(@valid_attrs)
      assert alteration.description == "some description"
      assert alteration.image == "some image"
      assert alteration.type == "some type"
    end

    test "create_alteration/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Alterations.create_alteration(@invalid_attrs)
    end

    test "update_alteration/2 with valid data updates the alteration" do
      alteration = alteration_fixture()
      assert {:ok, %Alteration{} = alteration} = Alterations.update_alteration(alteration, @update_attrs)
      assert alteration.description == "some updated description"
      assert alteration.image == "some updated image"
      assert alteration.type == "some updated type"
    end

    test "update_alteration/2 with invalid data returns error changeset" do
      alteration = alteration_fixture()
      assert {:error, %Ecto.Changeset{}} = Alterations.update_alteration(alteration, @invalid_attrs)
      assert alteration == Alterations.get_alteration!(alteration.id)
    end

    test "delete_alteration/1 deletes the alteration" do
      alteration = alteration_fixture()
      assert {:ok, %Alteration{}} = Alterations.delete_alteration(alteration)
      assert_raise Ecto.NoResultsError, fn -> Alterations.get_alteration!(alteration.id) end
    end

    test "change_alteration/1 returns a alteration changeset" do
      alteration = alteration_fixture()
      assert %Ecto.Changeset{} = Alterations.change_alteration(alteration)
    end
  end
end
