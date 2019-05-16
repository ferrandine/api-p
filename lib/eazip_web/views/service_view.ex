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
    %{
      id: service.id,
      value_base: service.value_base,
      clothe: render_one(service.clothe, ClotheView, "clothe.json"),
      alteration: render_one(service.alteration, AlterationView, "alteration.json"),
      category:
        render_one(
          service.alteration.alteration_category,
          AlterationCategoryView,
          "alteration_category.json"
        )
    }
  end
  
  def render("service_without_clothe.json", %{service: service}) do
    %{
      id: service.id,
      alteration: render_one(service.alteration, AlterationView, "alteration.json"),
      category:
        render_one(
          service.alteration.alteration_category,
          AlterationCategoryView,
          "alteration_category.json"
        )
    }
  end

  def render("by_category.json", %{service: service}) do
  %{
    category: service.category,
    services: render_many(service.services, ServiceView, "service_without_clothe.json")
  }
  end

  def render("for_clothe.json", %{data: data}) do
    %{data: %{
      clothe: data.clothe,
      services: render_many(data.services, ServiceView, "by_category.json")
    }}
  end
end
