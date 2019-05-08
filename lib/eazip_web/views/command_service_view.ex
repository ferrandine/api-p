defmodule EazipWeb.CommandServiceView do
  use EazipWeb, :view
  alias EazipWeb.CommandServiceView

  def render("index.json", %{command_services: command_services}) do
    %{data: render_many(command_services, CommandServiceView, "command_service.json")}
  end

  def render("show.json", %{command_service: command_service}) do
    %{data: render_one(command_service, CommandServiceView, "command_service.json")}
  end

  def render("command_service.json", %{command_service: command_service}) do
    %{id: command_service.id}
  end
end
