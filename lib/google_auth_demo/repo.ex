defmodule GoogleAuthDemo.Repo do
  use Ecto.Repo,
    otp_app: :google_auth_demo,
    adapter: Ecto.Adapters.Postgres
end
