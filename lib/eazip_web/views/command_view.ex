defmodule EazipWeb.CommandView do
  use EazipWeb, :view
  alias EazipWeb.CommandView

  def render("index.json", %{commands: commands}) do
    %{data: render_many(commands, CommandView, "command.json")}
  end

  def render("show.json", %{command: command}) do
    %{data: render_one(command, CommandView, "command.json")}
  end

  def render("command.json", %{command: command}) do
    %{id: command.id, status: command.status}
  end
end
