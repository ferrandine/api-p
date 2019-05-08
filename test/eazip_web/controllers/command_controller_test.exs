defmodule EazipWeb.CommandControllerTest do
  use EazipWeb.ConnCase

  alias Eazip.Commands
  alias Eazip.Commands.Command

  @create_attrs %{
    status: "some status"
  }
  @update_attrs %{
    status: "some updated status"
  }
  @invalid_attrs %{status: nil}

  def fixture(:command) do
    {:ok, command} = Commands.create_command(@create_attrs)
    command
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all commands", %{conn: conn} do
      conn = get(conn, Routes.command_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create command" do
    test "renders command when data is valid", %{conn: conn} do
      conn = post(conn, Routes.command_path(conn, :create), command: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.command_path(conn, :show, id))

      assert %{
               "id" => id,
               "status" => "some status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.command_path(conn, :create), command: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update command" do
    setup [:create_command]

    test "renders command when data is valid", %{conn: conn, command: %Command{id: id} = command} do
      conn = put(conn, Routes.command_path(conn, :update, command), command: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.command_path(conn, :show, id))

      assert %{
               "id" => id,
               "status" => "some updated status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, command: command} do
      conn = put(conn, Routes.command_path(conn, :update, command), command: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete command" do
    setup [:create_command]

    test "deletes chosen command", %{conn: conn, command: command} do
      conn = delete(conn, Routes.command_path(conn, :delete, command))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.command_path(conn, :show, command))
      end
    end
  end

  defp create_command(_) do
    command = fixture(:command)
    {:ok, command: command}
  end
end
