defmodule LineBotStarterWeb.BotController do
  use LineBotStarterWeb, :controller
  import Line.Client
  require Logger

  def webhook(conn, %{"events" => [%{"replyToken" => replyToken}]}) do
    messages = [text(Enum.random(["อือ", "555", "ค่ะ"]))]

    case messages |> reply(replyToken) do
      {:ok, resp} ->
        Logger.info(inspect(resp, pretty: true))
        conn |> send_resp(200, "OK")

      {:error, reason} ->
        Logger.error(inspect(reason, pretty: true))
        conn |> send_resp(500, "Internal server error")
    end
  end
end
