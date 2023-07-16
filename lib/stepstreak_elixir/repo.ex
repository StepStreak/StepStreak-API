defmodule StepstreakElixir.Repo do
  use Ecto.Repo,
    otp_app: :stepstreak_elixir,
    adapter: Ecto.Adapters.Postgres
end
