defmodule EazipWeb.Router do
  use EazipWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EazipWeb do
    pipe_through :api
  end
end
