# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :costco_mall,
  ecto_repos: [CostcoMall.Repo]

# Configures the endpoint
config :costco_mall, CostcoMallWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gmIXbnYaYVutBkZm7Z/L/HVUhseD49QmLUaLfKHm7X+o/upCZYEHcP1zTk7CFt6M",
  render_errors: [view: CostcoMallWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CostcoMall.PubSub,
  live_view: [signing_salt: "nlAELo0w"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
