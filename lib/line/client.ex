defmodule Line.Client do
  @reply_endpoint "https://api.line.me/v2/bot/message/reply"
  def reply(replyToken, messages) do
    line_client = Application.get_env(:line_bot_starter, Line.Client)

    HTTPoison.post!(
      @reply_endpoint,
      Poison.encode!(%{
        "replyToken" => replyToken,
        "messages" => messages
      }),
      [
        {"Content-Type", "application/json"},
        {"Authorization", "Bearer #{line_client[:channel_access_token]}"}
      ]
    )
  end
end
