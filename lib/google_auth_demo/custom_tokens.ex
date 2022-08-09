defmodule GoogleAuthDemo.CustomTokens do
  alias GoogleAuthDemo.CustomToken.CustomToken

  def get_signed_token(user_id) do
    signer = Joken.Signer.create("HS256", "secret")
    CustomToken.generate_and_sign(%{"user_id" => user_id}, signer)
  end
end
