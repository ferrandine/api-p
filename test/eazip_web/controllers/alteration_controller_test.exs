defmodule EazipWeb.AlterationControllerTest do
  use EazipWeb.ConnCase

  alias Eazip.Alterations
  alias Eazip.Alterations.Alteration

  @create_attrs %{
    description: "some description",
    image: "some image",
    type: "some type"
  }
  @update_attrs %{
    description: "some updated description",
    image: "some updated image",
    type: "some updated type"
  }
  @invalid_attrs %{description: nil, image: nil, type: nil}

  def fixture(:alteration) do
    {:ok, alteration} = Alterations.create_alteration(@create_attrs)
    alteration
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all alterations", %{conn: conn} do
      conn = get(conn, Routes.alteration_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create alteration" do
    test "renders alteration when data is valid", %{conn: conn} do
      conn = post(conn, Routes.alteration_path(conn, :create), alteration: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.alteration_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "image" => "some image",
               "type" => "some type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.alteration_path(conn, :create), alteration: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update alteration" do
    setup [:create_alteration]

    test "renders alteration when data is valid", %{conn: conn, alteration: %Alteration{id: id} = alteration} do
      conn = put(conn, Routes.alteration_path(conn, :update, alteration), alteration: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.alteration_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "image" => "some updated image",
               "type" => "some updated type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, alteration: alteration} do
      conn = put(conn, Routes.alteration_path(conn, :update, alteration), alteration: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete alteration" do
    setup [:create_alteration]

    test "deletes chosen alteration", %{conn: conn, alteration: alteration} do
      conn = delete(conn, Routes.alteration_path(conn, :delete, alteration))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.alteration_path(conn, :show, alteration))
      end
    end
  end

  defp create_alteration(_) do
    alteration = fixture(:alteration)
    {:ok, alteration: alteration}
  end
end
