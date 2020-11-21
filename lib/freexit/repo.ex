defmodule Freexit.Repo do
  use Ecto.Repo,
    otp_app: :freexit,
    adapter: Ecto.Adapters.Postgres
end
