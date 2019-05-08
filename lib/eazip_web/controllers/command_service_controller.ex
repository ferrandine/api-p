defmodule EazipWeb.CommandServiceController do
  use EazipWeb, :controller

  alias Eazip.Commands
  alias Eazip.Commands.CommandService

  action_fallback EazipWeb.FallbackController

  def index(conn, _params) do
    command_services = Commands.list_command_services()
    render(conn, "index.json", command_services: command_services)
  end

  def create(conn, %{"command_service" => command_service_params}) do
    with {:ok, %CommandService{} = command_service} <-
           Commands.create_command_service(command_service_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.command_service_path(conn, :show, command_service))
      |> render("show.json", command_service: command_service)
    end
  end

  def show(conn, %{"id" => id}) do
    command_service = Commands.get_command_service!(id)
    render(conn, "show.json", command_service: command_service)
  end

  def update(conn, %{"id" => id, "command_service" => command_service_params}) do
    command_service = Commands.get_command_service!(id)

    with {:ok, %CommandService{} = command_service} <-
           Commands.update_command_service(command_service, command_service_params) do
      render(conn, "show.json", command_service: command_service)
    end
  end

  def delete(conn, %{"id" => id}) do
    command_service = Commands.get_command_service!(id)

    with {:ok, %CommandService{}} <- Commands.delete_command_service(command_service) do
      send_resp(conn, :no_content, "")
    end
  end
end
