defmodule LineBotStarterWeb.BotController do
  use LineBotStarterWeb, :controller
  import Line.Client

  def webhook(conn, %{"events" => [%{"replyToken" => replyToken}]}) do
    Line.Client.reply(replyToken, [
      %{
        "type" => "text",
        "text" => Enum.random(["อือ", "555", "ค่ะ"])
      }
    ])

    conn |> send_resp(200, "OK")
  end
end
