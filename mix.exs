defmodule SplatoonMapsBot.Mixfile do
  use Mix.Project

  def project do
    [app: :splatoon_maps_bot,
     version: "0.0.2",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     escript: escript]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :nadia, :botan, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:nadia, "~> 0.4"},
      {:botan, "~> 0.1.0"},
      {:httpoison, "~> 0.8.0"},
      {:exvcr, "~> 0.7", only: :test}
    ]
  end

  defp escript do
    [main_module: SplatoonMapsBot]
  end
end
