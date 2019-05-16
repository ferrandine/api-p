defmodule EazipWeb.SewerProfileController do
  use EazipWeb, :controller

  alias Eazip.Sewers
  alias Eazip.Sewers.SewerProfile

  action_fallback EazipWeb.FallbackController

  def index(conn, _params) do
    sewer_profiles = Sewers.list_sewer_profiles()

    render(conn, "index.json", sewer_profiles: sewer_profiles)
  end

  def create(conn, %{"sewer_profile" => sewer_profile_params}) do
    with {:ok, %SewerProfile{} = sewer_profile} <-
           Sewers.create_sewer_profile(sewer_profile_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sewer_profile_path(conn, :show, sewer_profile))
      |> render("show.json", sewer_profile: sewer_profile)
    end
  end

  def show(conn, %{"id" => id}) do
    sewer_profile = Sewers.get_sewer_profile!(id)
    render(conn, "show.json", sewer_profile: sewer_profile)
  end

  def update(conn, %{"id" => id, "sewer_profile" => sewer_profile_params}) do
    sewer_profile = Sewers.get_sewer_profile!(id)

    with {:ok, %SewerProfile{} = sewer_profile} <-
           Sewers.update_sewer_profile(sewer_profile, sewer_profile_params) do
      render(conn, "show.json", sewer_profile: sewer_profile)
    end
  end

  def delete(conn, %{"id" => id}) do
    sewer_profile = Sewers.get_sewer_profile!(id)

    with {:ok, %SewerProfile{}} <- Sewers.delete_sewer_profile(sewer_profile) do
      send_resp(conn, :no_content, "")
    end
  end
end
