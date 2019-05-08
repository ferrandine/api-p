defmodule EazipWeb.AlterationCategoryController do
  use EazipWeb, :controller

  alias Eazip.Alterations
  alias Eazip.Alterations.AlterationCategory

  action_fallback EazipWeb.FallbackController

  def index(conn, _params) do
    alteration_categories = Alterations.list_alteration_categories()
    render(conn, "index.json", alteration_categories: alteration_categories)
  end

  def create(conn, %{"alteration_category" => alteration_category_params}) do
    with {:ok, %AlterationCategory{} = alteration_category} <-
           Alterations.create_alteration_category(alteration_category_params) do
      conn
      |> put_status(:created)
      |> put_resp_header(
        "location",
        Routes.alteration_category_path(conn, :show, alteration_category)
      )
      |> render("show.json", alteration_category: alteration_category)
    end
  end

  def show(conn, %{"id" => id}) do
    alteration_category = Alterations.get_alteration_category!(id)
    render(conn, "show.json", alteration_category: alteration_category)
  end

  def update(conn, %{"id" => id, "alteration_category" => alteration_category_params}) do
    alteration_category = Alterations.get_alteration_category!(id)

    with {:ok, %AlterationCategory{} = alteration_category} <-
           Alterations.update_alteration_category(alteration_category, alteration_category_params) do
      render(conn, "show.json", alteration_category: alteration_category)
    end
  end

  def delete(conn, %{"id" => id}) do
    alteration_category = Alterations.get_alteration_category!(id)

    with {:ok, %AlterationCategory{}} <-
           Alterations.delete_alteration_category(alteration_category) do
      send_resp(conn, :no_content, "")
    end
  end
end
