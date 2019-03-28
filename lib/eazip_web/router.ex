defmodule EazipWeb.Router do
  use EazipWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EazipWeb do
    pipe_through :api

    get "/", HelloController, :index
  end
end
