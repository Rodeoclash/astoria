defmodule AstoriaWeb.Router do
  use AstoriaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug AstoriaWeb.Plugs.SetSessionCurrentUserPlug
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    plug :accepts, ["json"]
    plug AstoriaWeb.Plugs.SetSessionCurrentUserPlug
    plug AstoriaWeb.Plugs.SetGraphQLContextPlug
  end

  pipeline :current_user_required do
    plug AstoriaWeb.Plugs.CurrentUserRequiredPlug
  end

  scope "/api", AstoriaWeb, as: :api do
    pipe_through :api

    scope "/github", Github, as: :github do
      post "/webhook", WebhookController, :create
    end
  end

  scope "/graphql" do
    pipe_through :graphql
    forward "/", Absinthe.Plug, schema: AstoriaWeb.Schema
  end

  scope "/auth", AstoriaWeb do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  scope "/installed", AstoriaWeb do
    pipe_through :browser

    get "/:provider", InstalledController, :callback
  end

  if Mix.env() in [:dev, :test] do
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: AstoriaWeb.Schema,
      socket: AstoriaWeb.UserSocket,
      interface: :playground,
      default_url: "/graphql"
  end

  scope "/", AstoriaWeb do
    pipe_through :browser

    scope "/admin", Admin, as: :admin do
      pipe_through :current_user_required
      get "/current_user", CurrentUserController, :show
    end

    scope "/dashboard" do
      pipe_through :current_user_required
      get "/", DashboardController, :show, as: :dashboard_root
      get "/*path", DashboardController, :show
    end

    get "/", HomeController, :show, as: :homepage_root
    get "/*path", HomeController, :show
  end
end
