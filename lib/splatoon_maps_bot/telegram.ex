defmodule SplatoonMapsBot.Telegram do
  require Logger
  alias SplatoonMapsBot.MessagesHandler

  def get_updates(offset \\ 0) do
    response = Nadia.get_updates(timeout: 60, offset: offset)

    case response do
      {:ok, []} -> get_updates(offset)
      {:ok, updates} -> fetch_updates(updates) |> get_updates
      {:error, %Nadia.Model.Error{reason: :timeout}} -> get_updates(offset)
      {:error, %Nadia.Model.Error{reason: :nxdomain}} ->
        Logger.error "Telegram connection error"
        get_updates(offset)
    end
  end

  defp fetch_updates([update]) do
    handle_update(update)
    %{update_id: update_id} = update

    update_id + 1
  end

  defp fetch_updates([head|updates]) do
    handle_update(head)
    fetch_updates(updates)
  end

  defp handle_update(payload) do
    spawn fn -> MessagesHandler.reply(payload) end
    spawn fn -> track(payload) end
  end

  defp track(%{message: %{text: event, from: %{id: uid}}}) do
    if event == "/start" || event == "Stay fresh!" do
      Botan.track(event, uid)
    end
  end
end
