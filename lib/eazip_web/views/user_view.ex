defmodule EazipWeb.UserView do
  use EazipWeb, :view
  alias EazipWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      sex: user.sex,
      birthdate: user.birthdate,
      country: user.country,
      city: user.city,
      post_code: user.post_code,
      street: user.street,
      type: user.type
    }
  end
end
