defmodule EazipWeb.SewerProfileControllerTest do
  use EazipWeb.ConnCase

  alias Eazip.Sewers
  alias Eazip.Sewers.SewerProfile

  @create_attrs %{
    description: "some description",
    picture: "some picture"
  }
  @update_attrs %{
    description: "some updated description",
    picture: "some updated picture"
  }
  @invalid_attrs %{description: nil, picture: nil}

  def fixture(:sewer_profile) do
    {:ok, sewer_profile} = Sewers.create_sewer_profile(@create_attrs)
    sewer_profile
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sewer_profiles", %{conn: conn} do
      conn = get(conn, Routes.sewer_profile_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sewer_profile" do
    test "renders sewer_profile when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sewer_profile_path(conn, :create), sewer_profile: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.sewer_profile_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "picture" => "some picture"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sewer_profile_path(conn, :create), sewer_profile: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sewer_profile" do
    setup [:create_sewer_profile]

    test "renders sewer_profile when data is valid", %{
      conn: conn,
      sewer_profile: %SewerProfile{id: id} = sewer_profile
    } do
      conn =
        put(conn, Routes.sewer_profile_path(conn, :update, sewer_profile),
          sewer_profile: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.sewer_profile_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "picture" => "some updated picture"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, sewer_profile: sewer_profile} do
      conn =
        put(conn, Routes.sewer_profile_path(conn, :update, sewer_profile),
          sewer_profile: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sewer_profile" do
    setup [:create_sewer_profile]

    test "deletes chosen sewer_profile", %{conn: conn, sewer_profile: sewer_profile} do
      conn = delete(conn, Routes.sewer_profile_path(conn, :delete, sewer_profile))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.sewer_profile_path(conn, :show, sewer_profile))
      end
    end
  end

  defp create_sewer_profile(_) do
    sewer_profile = fixture(:sewer_profile)
    {:ok, sewer_profile: sewer_profile}
  end
end
