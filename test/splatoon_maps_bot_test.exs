defmodule SplatoonMapsBotTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  doctest SplatoonMapsBot

  setup_all do
    HTTPoison.start
  end

  test "InkApiClient.refresh" do
    use_cassette "splatoonink" do
      result = SplatoonMapsBot.InkApiClient.refresh

      assert result == "Now\nTurf War: Arowana Mall, Flounder Heights\n\
Rainmaker: Urchin Underpass, Mahi-Mahi Resort\n\n\
Next\nTurf War: Saltspray Rig, Mahi-Mahi Resort\n\
Splat Zones: Blackbelly Skatepark, Ancho-V Games"
    end
  end
end
