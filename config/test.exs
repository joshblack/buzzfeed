use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :buzzfeed, Buzzfeed.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :buzzfeed, Buzzfeed.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "buzzfeed_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
