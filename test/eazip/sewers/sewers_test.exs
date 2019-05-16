defmodule Eazip.SewersTest do
  use Eazip.DataCase

  alias Eazip.Sewers

  describe "sewer_profiles" do
    alias Eazip.Sewers.SewerProfile

    @valid_attrs %{description: "some description", picture: "some picture"}
    @update_attrs %{description: "some updated description", picture: "some updated picture"}
    @invalid_attrs %{description: nil, picture: nil}

    def sewer_profile_fixture(attrs \\ %{}) do
      {:ok, sewer_profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sewers.create_sewer_profile()

      sewer_profile
    end

    test "list_sewer_profiles/0 returns all sewer_profiles" do
      sewer_profile = sewer_profile_fixture()
      assert Sewers.list_sewer_profiles() == [sewer_profile]
    end

    test "get_sewer_profile!/1 returns the sewer_profile with given id" do
      sewer_profile = sewer_profile_fixture()
      assert Sewers.get_sewer_profile!(sewer_profile.id) == sewer_profile
    end

    test "create_sewer_profile/1 with valid data creates a sewer_profile" do
      assert {:ok, %SewerProfile{} = sewer_profile} = Sewers.create_sewer_profile(@valid_attrs)
      assert sewer_profile.description == "some description"
      assert sewer_profile.picture == "some picture"
    end

    test "create_sewer_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sewers.create_sewer_profile(@invalid_attrs)
    end

    test "update_sewer_profile/2 with valid data updates the sewer_profile" do
      sewer_profile = sewer_profile_fixture()

      assert {:ok, %SewerProfile{} = sewer_profile} =
               Sewers.update_sewer_profile(sewer_profile, @update_attrs)

      assert sewer_profile.description == "some updated description"
      assert sewer_profile.picture == "some updated picture"
    end

    test "update_sewer_profile/2 with invalid data returns error changeset" do
      sewer_profile = sewer_profile_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Sewers.update_sewer_profile(sewer_profile, @invalid_attrs)

      assert sewer_profile == Sewers.get_sewer_profile!(sewer_profile.id)
    end

    test "delete_sewer_profile/1 deletes the sewer_profile" do
      sewer_profile = sewer_profile_fixture()
      assert {:ok, %SewerProfile{}} = Sewers.delete_sewer_profile(sewer_profile)
      assert_raise Ecto.NoResultsError, fn -> Sewers.get_sewer_profile!(sewer_profile.id) end
    end

    test "change_sewer_profile/1 returns a sewer_profile changeset" do
      sewer_profile = sewer_profile_fixture()
      assert %Ecto.Changeset{} = Sewers.change_sewer_profile(sewer_profile)
    end
  end
end
