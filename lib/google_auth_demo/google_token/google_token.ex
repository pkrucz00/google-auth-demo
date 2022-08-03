defmodule GoogleAuthDemo.GoogleToken.GoogleToken do
  @moduledoc """
  Module to VERIFY and VALIDATE the Google Auth token. It is NOT used for signing.
  """

  alias Joken.Config

  @client_id "339154308827-orcc5ip8dajc3as2rgtkuvl08cmvqjn6.apps.googleusercontent.com"
  @possible_issuers ["accounts.google.com", "https://accounts.google.com"]

  def verify_and_validate(jwt_token, signer) do
    Joken.verify_and_validate!(get_claims, jwt_token, signer)
  end

  defp get_claims() do
    %{}
    |> Config.add_claim("aud", nil, &(&1 == @client_id))
    |> Config.add_claim("exp", nil, &(Joken.current_time() <= &1))
    |> Config.add_claim("iss", nil, &Enum.member?(@possible_issuers, &1))
  end
end
