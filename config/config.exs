# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :records,
  ecto_repos: [Records.Repo]

# Configures the endpoint
config :records, RecordsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9H4RlJQVDDLERv6DJO8GuG3cyQMrgRWCVwF9y0mVlmVEFvVF+Z9g8Dobf7T9l73c",
  render_errors: [view: RecordsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Records.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
