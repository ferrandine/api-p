defmodule EazipWeb.AlterationCategoryControllerTest do
  use EazipWeb.ConnCase

  alias Eazip.Alterations
  alias Eazip.Alterations.AlterationCategory

  @create_attrs %{
    type: "some type"
  }
  @update_attrs %{
    type: "some updated type"
  }
  @invalid_attrs %{type: nil}

  def fixture(:alteration_category) do
    {:ok, alteration_category} = Alterations.create_alteration_category(@create_attrs)
    alteration_category
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all alteration_categories", %{conn: conn} do
      conn = get(conn, Routes.alteration_category_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create alteration_category" do
    test "renders alteration_category when data is valid", %{conn: conn} do
      conn = post(conn, Routes.alteration_category_path(conn, :create), alteration_category: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.alteration_category_path(conn, :show, id))

      assert %{
               "id" => id,
               "type" => "some type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.alteration_category_path(conn, :create), alteration_category: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update alteration_category" do
    setup [:create_alteration_category]

    test "renders alteration_category when data is valid", %{conn: conn, alteration_category: %AlterationCategory{id: id} = alteration_category} do
      conn = put(conn, Routes.alteration_category_path(conn, :update, alteration_category), alteration_category: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.alteration_category_path(conn, :show, id))

      assert %{
               "id" => id,
               "type" => "some updated type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, alteration_category: alteration_category} do
      conn = put(conn, Routes.alteration_category_path(conn, :update, alteration_category), alteration_category: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete alteration_category" do
    setup [:create_alteration_category]

    test "deletes chosen alteration_category", %{conn: conn, alteration_category: alteration_category} do
      conn = delete(conn, Routes.alteration_category_path(conn, :delete, alteration_category))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.alteration_category_path(conn, :show, alteration_category))
      end
    end
  end

  defp create_alteration_category(_) do
    alteration_category = fixture(:alteration_category)
    {:ok, alteration_category: alteration_category}
  end
end
