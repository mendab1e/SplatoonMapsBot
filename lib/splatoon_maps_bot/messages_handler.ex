defmodule SplatoonMapsBot.MessagesHandler do
  alias SplatoonMapsBot.InkApiClient

  def reply(%{message: %{text: "/start", chat: %{id: chat_id}}}) do
    chat_id |> Nadia.send_message(
      "Use 'Stay fresh!' button to get maps and modes",
      reply_markup: reply_keyboard
    )
  end

  def reply(%{message: %{text: "Stay fresh!", chat: %{id: chat_id}}}) do
    Nadia.send_message(chat_id, InkApiClient.refresh)
  end

  def reply(%{message: %{text: _text, chat: %{id: chat_id}}}) do
    Nadia.send_message(chat_id, "Stay fresh!")
  end

  defp reply_keyboard do
    %Nadia.Model.ReplyKeyboardMarkup{keyboard: [["Stay fresh!"]]}
  end
end
