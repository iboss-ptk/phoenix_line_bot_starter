defmodule LineBotStarterWeb.BotController do
  use LineBotStarterWeb, :controller

  def webhook(conn, %{"events" => [%{"replyToken" => replyToken}]}) do
    line_auth = Application.get_env(:line_bot_starter, LineBotStarterWeb.LineAuthentication)

    HTTPoison.post!(
      "https://api.line.me/v2/bot/message/reply",
      Poison.encode!(%{
        "replyToken" => replyToken,
        "messages" => [
          %{
            "type" => "text",
            "text" => Enum.random(["อือ", "555", "ค่ะ"])
          }
        ]
      }),
      [
        {"Content-Type", "application/json"},
        {"Authorization", "Bearer #{line_auth[:channel_access_token]}"}
        |> IO.inspect(label: "acc")
      ]
    )

    conn |> send_resp(200, "OK")
  end
end
