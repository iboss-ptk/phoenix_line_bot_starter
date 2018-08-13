defmodule LineBotStarterWeb.BotController do
  use LineBotStarterWeb, :controller
  import Line.Client

  def webhook(conn, %{"events" => [%{"replyToken" => replyToken}]}) do
    [text(Enum.random(["อือ", "555", "ค่ะ"]))] |> reply(replyToken)
    conn |> send_resp(200, "OK")
  end
end
