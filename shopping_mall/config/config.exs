# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :shopping_mall, ShoppingMallWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lxnMaDW8S6Alo4C/X3HeJPq9OwrItIxUF9CDXd6/3bxLcvBy8gN5yxzo4oVZZicR",
  render_errors: [view: ShoppingMallWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ShoppingMall.PubSub,
  live_view: [signing_salt: "cAa6ChC/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
