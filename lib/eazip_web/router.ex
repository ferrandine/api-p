defmodule EazipWeb.Router do
  use EazipWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EazipWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit] do
      get "/commands", CommandController, :index_for_user
    end

    resources "/clothes", ClotheController, except: [:new, :edit] do
      get "/services", ServiceController, :index_for_clothe
    end

    resources "/alterations", AlterationController, except: [:new, :edit]
    resources "/alteration_categories", AlterationCategoryController, except: [:new, :edit]
    resources "/services", ServiceController, except: [:new, :edit]
    resources "/commands", CommandController, except: [:new, :edit]
    resources "/sewers", SewerProfileController, except: [:new, :edit]
  end
end
