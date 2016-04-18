defmodule SplatoonMapsBot.InkApiClient do
  require Logger

  @endpoint "http://splatoon.ink/schedule.json"

  def refresh do
    case HTTPoison.get(@endpoint) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body |> parse_response
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        Logger.error "404"
        "Can't get Inkpolis news :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error reason
        "Sorry, some kind of error has accured. Please contact to @timur."
    end
  end

  defp parse_response(response) do
    schedule = response
    |> Poison.decode!
    |> Dict.get("schedule")
    |> Enum.map(&(parse_rotation &1))
    |> build_reply
  end

  defp parse_rotation(%{"modes" => modes}) do
    modes |> Enum.map(&(parse_mode &1))
  end

  defp parse_mode(%{"maps" => maps, "rules" => %{"en" => rules}}) do
    maps = maps
    |> Enum.map(&(Dict.get(&1, "nameEN")))
    |> Enum.join(", ")

    "#{rules}: #{maps}"
  end

  defp build_reply(schedule) do
    modes_now  = schedule |> Enum.at(0) |> Enum.join("\n")
    modes_next = schedule |> Enum.at(1) |> Enum.join("\n")

    "Now\n#{modes_now}\n\nNext\n#{modes_next}"
  end
end
