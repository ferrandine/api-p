defmodule EazipWeb.Router do
  use EazipWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EazipWeb do
    pipe_through :api

    get "/", HelloController, :index
    resources "/users", UserController, except: [:new, :edit]
    resources "/clothes", ClotheController, except: [:new, :edit]
    resources "/alterations", AlterationController, except: [:new, :edit]
  end
end
