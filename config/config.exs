# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :buzzfeed,
  ecto_repos: [Buzzfeed.Repo]

# Configures the endpoint
config :buzzfeed, Buzzfeed.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "86pFvXncjQTxuse73Jb+Idlfl29K08cmL5ZodwT/zE4kZX/nnFu6ucJE4FDmCVNj",
  render_errors: [view: Buzzfeed.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Buzzfeed.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
