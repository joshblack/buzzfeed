defmodule Buzzfeed.Router do
  use Buzzfeed.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :v1 do
    plug :accepts, ["json"]
    plug Buzzfeed.APIVersion, version: :v1
  end

  scope "/", Buzzfeed do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
    resources "/projects", ProjectController
  end

  scope "/api", Buzzfeed do
    scope "/v1" do
      pipe_through :v1

      get "/:id", TrackerController, :index
    end
  end
end
