# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :freexit,
  ecto_repos: [Freexit.Repo]

# Configures the endpoint
config :freexit, FreexitWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jMzKiva55WdSBrZ66k4K4jLLPsBNLF1/a8G7852bjoLUZc500l8pO53oBUECO497",
  render_errors: [view: FreexitWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Freexit.PubSub,
  live_view: [signing_salt: "RPT7YTtC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
