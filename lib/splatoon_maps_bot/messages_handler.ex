defmodule SplatoonMapsBot.MessagesHandler do
  def reply(%{message: %{text: "/start", chat: %{id: chat_id}}}) do
    Nadia.send_message(chat_id, "Use 'Stay fresh!' command to get maps")
  end

  def reply(%{message: %{text: "Stay fresh!", chat: %{id: chat_id}}}) do
    Nadia.send_message(chat_id, "maps")
  end

  def reply(%{message: %{text: _text, chat: %{id: chat_id}}}) do
    Nadia.send_message(chat_id, "Stay fresh!")
  end
end
