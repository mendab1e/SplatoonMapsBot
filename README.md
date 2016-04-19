# SplatoonMapsBot

This Telegram bot provides information about current maps and modes in [Splatoon](http://splatoon.nintendo.com).

https://telegram.me/splatoon_bot

<img width="480" alt="screenshot" src="https://cloud.githubusercontent.com/assets/854386/14634127/a35387da-0631-11e6-8451-979ee8e07593.png">

## System requirements

* Erlang/OTP 18

* Elixir 1.2

## Configuration
[Register your bot](https://core.telegram.org/bots#3-how-do-i-create-a-bot) in Telegram and obtain a token.

Add your Telegram bot token to `config/config.exs`:
```elixir
config :nadia, token: "replace_with_telegram_token"
```

Create Botan.io account (analytics for your Telegram bot):
 1. Go to [Botaniobot](https://telegram.me/botaniobot?start=src=github)
 2. Use Add bot command to get a token

Add your Botan.io token to `config/config.exs`:
```elixir
config :botan, token: "replace_with_botan_token"
```

## Installation

Build the application using mix:
```
$ env MIX_ENV=prod mix escript.build
```
You can find more information about building escript [here](http://elixir-lang.org/docs/stable/mix/Mix.Tasks.Escript.Build.html).

Run the application:
```
$ ./splatoon_maps_bot
```

Stay fresh!