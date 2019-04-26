defmodule EazipWeb.AlterationCategoryView do
  use EazipWeb, :view
  alias EazipWeb.AlterationCategoryView

  def render("index.json", %{alteration_categories: alteration_categories}) do
    %{data: render_many(alteration_categories, AlterationCategoryView, "alteration_category.json")}
  end

  def render("show.json", %{alteration_category: alteration_category}) do
    %{data: render_one(alteration_category, AlterationCategoryView, "alteration_category.json")}
  end

  def render("alteration_category.json", %{alteration_category: alteration_category}) do
    %{id: alteration_category.id,
      type: alteration_category.type}
  end
end
