defmodule EazipWeb.ClotheView do
  use EazipWeb, :view
  alias EazipWeb.ClotheView

  def render("index.json", %{clothes: clothes}) do
    %{data: render_many(clothes, ClotheView, "clothe.json")}
  end

  def render("show.json", %{clothe: clothe}) do
    %{data: render_one(clothe, ClotheView, "clothe.json")}
  end

  def render("clothe.json", %{clothe: clothe}) do
    %{id: clothe.id, image: clothe.image, type: clothe.type}
  end
end
