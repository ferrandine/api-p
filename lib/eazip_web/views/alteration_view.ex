defmodule EazipWeb.AlterationView do
  use EazipWeb, :view
  alias EazipWeb.AlterationView

  def render("index.json", %{alterations: alterations}) do
    %{data: render_many(alterations, AlterationView, "alteration.json")}
  end

  def render("show.json", %{alteration: alteration}) do
    %{data: render_one(alteration, AlterationView, "alteration.json")}
  end

  def render("alteration.json", %{alteration: alteration}) do
    %{
      description: alteration.description,
      id: alteration.id,
      image: alteration.image,
      label: alteration.label,
      type: alteration.type
    }
  end
end
