defmodule EazipWeb.CommandController do
  use EazipWeb, :controller

  alias Eazip.Commands
  alias Eazip.Commands.Command

  action_fallback EazipWeb.FallbackController

  def index(conn, _params) do
    commands = Commands.list_commands()
    render(conn, "index.json", commands: commands)
  end

  def index_for_user(conn, %{"user_id" => id}) do
    commands = Commands.for_user(id)

    render(conn, "index.json", commands: commands)
  end

  def index_for_sewer(conn, %{"sewer_profile_id" => id}) do
    commands = Commands.for_sewer(id)

    render(conn, "index.json", commands: commands)
  end

  def create(conn, %{"command" => command_params}) do
    with {:ok, %Command{} = command} <- Commands.create_command(command_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.command_path(conn, :show, command))
      |> render("show.json", command: command)
    end
  end

  def show(conn, %{"id" => id}) do
    command = Commands.get_command!(id)
    render(conn, "show.json", command: command)
  end

  def update(conn, %{"id" => id, "command" => command_params}) do
    command = Commands.get_command!(id)

    with {:ok, %Command{} = command} <- Commands.update_command(command, command_params) do
      render(conn, "show.json", command: command)
    end
  end

  def delete(conn, %{"id" => id}) do
    command = Commands.get_command!(id)

    with {:ok, %Command{}} <- Commands.delete_command(command) do
      send_resp(conn, :no_content, "")
    end
  end
end
