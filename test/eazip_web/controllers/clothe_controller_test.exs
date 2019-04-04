defmodule EazipWeb.ClotheControllerTest do
  use EazipWeb.ConnCase

  alias Eazip.Clothes
  alias Eazip.Clothes.Clothe

  @create_attrs %{
    image: "some image",
    type: "some type"
  }
  @update_attrs %{
    image: "some updated image",
    type: "some updated type"
  }
  @invalid_attrs %{image: nil, type: nil}

  def fixture(:clothe) do
    {:ok, clothe} = Clothes.create_clothe(@create_attrs)
    clothe
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all clothes", %{conn: conn} do
      conn = get(conn, Routes.clothe_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create clothe" do
    test "renders clothe when data is valid", %{conn: conn} do
      conn = post(conn, Routes.clothe_path(conn, :create), clothe: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.clothe_path(conn, :show, id))

      assert %{
               "id" => id,
               "image" => "some image",
               "type" => "some type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.clothe_path(conn, :create), clothe: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update clothe" do
    setup [:create_clothe]

    test "renders clothe when data is valid", %{conn: conn, clothe: %Clothe{id: id} = clothe} do
      conn = put(conn, Routes.clothe_path(conn, :update, clothe), clothe: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.clothe_path(conn, :show, id))

      assert %{
               "id" => id,
               "image" => "some updated image",
               "type" => "some updated type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, clothe: clothe} do
      conn = put(conn, Routes.clothe_path(conn, :update, clothe), clothe: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete clothe" do
    setup [:create_clothe]

    test "deletes chosen clothe", %{conn: conn, clothe: clothe} do
      conn = delete(conn, Routes.clothe_path(conn, :delete, clothe))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.clothe_path(conn, :show, clothe))
      end
    end
  end

  defp create_clothe(_) do
    clothe = fixture(:clothe)
    {:ok, clothe: clothe}
  end
end
