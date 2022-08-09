defmodule GoogleAuthDemo.CustomToken.CustomToken do
  @moduledoc """
  Configuration of custom token used on frontend for user verification
  """

  use Joken.Config

  @issuer "swmansion.com"

  @impl true
  def token_config, do: default_claims(default_exp: 24 * 60 * 60, iss: @issuer, aud: @issuer)
end
