defmodule EazipWeb.AlterationController do
  use EazipWeb, :controller

  alias Eazip.Alterations
  alias Eazip.Alterations.Alteration

  action_fallback EazipWeb.FallbackController

  def index(conn, _params) do
    alterations = Alterations.list_alterations()
    render(conn, "index.json", alterations: alterations)
  end

  def create(conn, %{"alteration" => alteration_params}) do
    with {:ok, %Alteration{} = alteration} <- Alterations.create_alteration(alteration_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.alteration_path(conn, :show, alteration))
      |> render("show.json", alteration: alteration)
    end
  end

  def show(conn, %{"id" => id}) do
    alteration = Alterations.get_alteration!(id)
    render(conn, "show.json", alteration: alteration)
  end

  def update(conn, %{"id" => id, "alteration" => alteration_params}) do
    alteration = Alterations.get_alteration!(id)

    with {:ok, %Alteration{} = alteration} <-
           Alterations.update_alteration(alteration, alteration_params) do
      render(conn, "show.json", alteration: alteration)
    end
  end

  def delete(conn, %{"id" => id}) do
    alteration = Alterations.get_alteration!(id)

    with {:ok, %Alteration{}} <- Alterations.delete_alteration(alteration) do
      send_resp(conn, :no_content, "")
    end
  end
end
