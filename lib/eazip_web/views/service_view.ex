defmodule EazipWeb.ServiceView do
  use EazipWeb, :view
  alias EazipWeb.ServiceView
  alias EazipWeb.AlterationCategoryView
  alias EazipWeb.ClotheView
  alias EazipWeb.AlterationView

  def render("index.json", %{services: services}) do
    %{data: render_many(services, ServiceView, "service.json")}
  end

  def render("show.json", %{service: service}) do
    %{data: render_one(service, ServiceView, "service.json")}
  end

  def render("service.json", %{service: service}) do
    %{id: service.id,
      value_base: service.value_base,
      clothe: render_one(service.clothe, ClotheView, "clothe.json"),
      alteration: render_one(service.alteration, AlterationView, "alteration.json"),
      category: render_one(service.alteration.alteration_category, AlterationCategoryView, "alteration_category.json")}
  end
end
