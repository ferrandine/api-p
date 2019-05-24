defmodule EazipWeb.SewerProfileView do
  use EazipWeb, :view
  alias EazipWeb.SewerProfileView

  def render("index.json", %{sewer_profiles: sewer_profiles}) do
    %{data: render_many(sewer_profiles, SewerProfileView, "sewer_profile.json")}
  end

  def render("show.json", %{sewer_profile: sewer_profile}) do
    %{data: render_one(sewer_profile, SewerProfileView, "sewer_profile.json")}
  end

  def render("sewer_profile.json", %{sewer_profile: sewer_profile}) do
    %{
      id: sewer_profile.id,
      picture: sewer_profile.picture,
      description: sewer_profile.description,
      first_name: sewer_profile.user.first_name,
      last_name: sewer_profile.user.last_name,
      rating:
        case sewer_profile.rating do
          nil -> nil
          rating -> rating |> Decimal.round() |> Decimal.to_integer()
        end
    }
  end
end
