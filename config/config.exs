# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :line_bot_starter, LineBotStarterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3ayF2dB2VqsAxB3txOQUrPkxqPBjB4XbRlsRp7gwa3GkaTmsG0iX4FvO23wxIhR0",
  render_errors: [view: LineBotStarterWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: LineBotStarter.PubSub, adapter: Phoenix.PubSub.PG2]

config :line_bot_starter, LineBotStarterWeb.LineAuthentication,
  channel_secret: System.get_env("LINE_CHANNEL_SECRET"),
  channel_access_token: System.get_env("LINE_CHANNEL_ACCESS_TOKEN")

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
