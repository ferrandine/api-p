defmodule EazipWeb.ClotheController do
  use EazipWeb, :controller

  alias Eazip.Clothes
  alias Eazip.Clothes.Clothe

  action_fallback EazipWeb.FallbackController

  def index(conn, _params) do
    clothes = Clothes.list_clothes()
    render(conn, "index.json", clothes: clothes)
  end

  def create(conn, %{"clothe" => clothe_params}) do
    with {:ok, %Clothe{} = clothe} <- Clothes.create_clothe(clothe_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.clothe_path(conn, :show, clothe))
      |> render("show.json", clothe: clothe)
    end
  end

  def show(conn, %{"id" => id}) do
    clothe = Clothes.get_clothe!(id)
    render(conn, "show.json", clothe: clothe)
  end

  def update(conn, %{"id" => id, "clothe" => clothe_params}) do
    clothe = Clothes.get_clothe!(id)

    with {:ok, %Clothe{} = clothe} <- Clothes.update_clothe(clothe, clothe_params) do
      render(conn, "show.json", clothe: clothe)
    end
  end

  def delete(conn, %{"id" => id}) do
    clothe = Clothes.get_clothe!(id)

    with {:ok, %Clothe{}} <- Clothes.delete_clothe(clothe) do
      send_resp(conn, :no_content, "")
    end
  end
end
