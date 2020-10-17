defmodule AstoriaWeb.Router do
  use AstoriaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug AstoriaWeb.Plugs.SetCurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AstoriaWeb do
    pipe_through :browser

    get "/", PageController, :index

    scope "/github", Github, as: :github do
      get "/authorized", AuthorizedController, :show
    end

    scope "/admin", Admin, as: :admin do
      get "/current_user", CurrentUserController, :show
    end
  end

  scope "/api", AstoriaWeb, as: :api do
    pipe_through :api

    scope "/github", Github, as: :github do
      post "/webhook", WebhookController, :create
    end
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: AstoriaWeb.Telemetry
    end
  end
end
