defmodule Eazip.Repo do
  use Ecto.Repo,
    otp_app: :eazip,
    adapter: Ecto.Adapters.Postgres
end
