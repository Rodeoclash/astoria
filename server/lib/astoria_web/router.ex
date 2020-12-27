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

  scope "/", AstoriaWeb do
    pipe_through :browser

    get "/", HomeController, :show

    get "/dashboard", DashboardController, :show
    #get "/dashboard*path", DashboardController, :show

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
      interface: :playground,
      default_url: "/graphql"
  end
end
