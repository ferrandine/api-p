defmodule EazipWeb.CommandServiceControllerTest do
  use EazipWeb.ConnCase

  alias Eazip.Commands
  alias Eazip.Commands.CommandService

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:command_service) do
    {:ok, command_service} = Commands.create_command_service(@create_attrs)
    command_service
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all command_services", %{conn: conn} do
      conn = get(conn, Routes.command_service_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create command_service" do
    test "renders command_service when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.command_service_path(conn, :create), command_service: @create_attrs)

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.command_service_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.command_service_path(conn, :create), command_service: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update command_service" do
    setup [:create_command_service]

    test "renders command_service when data is valid", %{
      conn: conn,
      command_service: %CommandService{id: id} = command_service
    } do
      conn =
        put(conn, Routes.command_service_path(conn, :update, command_service),
          command_service: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.command_service_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, command_service: command_service} do
      conn =
        put(conn, Routes.command_service_path(conn, :update, command_service),
          command_service: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete command_service" do
    setup [:create_command_service]

    test "deletes chosen command_service", %{conn: conn, command_service: command_service} do
      conn = delete(conn, Routes.command_service_path(conn, :delete, command_service))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.command_service_path(conn, :show, command_service))
      end
    end
  end

  defp create_command_service(_) do
    command_service = fixture(:command_service)
    {:ok, command_service: command_service}
  end
end
