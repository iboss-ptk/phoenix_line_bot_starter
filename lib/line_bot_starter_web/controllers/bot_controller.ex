defmodule LineBotStarterWeb.BotController do
  use LineBotStarterWeb, :controller

  def webhook(conn, _params) do
    conn |> send_resp(200, "OK")
  end
end
