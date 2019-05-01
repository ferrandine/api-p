defmodule EazipWeb.ServiceView do
  use EazipWeb, :view
  alias EazipWeb.ServiceView

  def render("index.json", %{services: services}) do
    %{data: render_many(services, ServiceView, "service.json")}
  end

  def render("show.json", %{service: service}) do
    %{data: render_one(service, ServiceView, "service.json")}
  end

  def render("service.json", %{service: service}) do
    %{id: service.id,
      value_base: service.value_base,
      clothe: service.clothe.type,
      alteration: service.alteration.type,
      category: service.alteration.alteration_category.type
    }
  end
end
