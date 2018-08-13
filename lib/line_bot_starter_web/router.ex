defmodule LineBotStarterWeb.Router do
  use LineBotStarterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LineBotStarterWeb do
    pipe_through :api
  end
end
