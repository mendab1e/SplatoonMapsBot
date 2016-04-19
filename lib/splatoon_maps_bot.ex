defmodule SplatoonMapsBot do
  alias SplatoonMapsBot.Telegram

  def main(_args) do
    IO.puts "Listening, stay fresh!"
    Telegram.get_updates
  end
end
