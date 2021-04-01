defmodule ElevatorMedia do
  defmodule Streamer do
    defstruct game: "<iframe width=100% height=100% src=https://www.addictinggames.com/embed/html5-games/23635 scrolling=no></iframe>", ada: "<div class=nomics-ticker-widget data-name=Cardano data-base=ADA data-quote=USD></div><script src=https://widget.nomics.com/embed.js></script>"

    # This the the main function
    def getContent(data) do
      cond do
        data == "game" -> game()
        data == "ada" -> ada()
        data == "quote data" -> quote_data()
        data == "quote status" -> quote_status()
      end
    end

    # This will format any data we pass in
    def format(data) do
      "<div> #{data} </div>"
    end

    # This will format the game
    def game do
      game = "<iframe width=100% height=100% src=https://www.addictinggames.com/embed/html5-games/23635 scrolling=no></iframe>"
      format(game)
    end

    # This will format the Cardano chart
    def ada do
      ada = "<div class=nomics-ticker-widget data-name=Cardano data-base=ADA data-quote=USD></div><script src=https://widget.nomics.com/embed.js></script>"
      format(ada)
    end

    # This will return a formated response from the HTTP get request
    def quote_data do
      response = HTTPoison.get!("http://getmeaquote.designedbyaturtle.com/")
      format(response.body)
    end

    # This will return the status code of a get request
    def quote_status do
      response = HTTPoison.get!("http://getmeaquote.designedbyaturtle.com/")
      response.status_code
    end

  end
end
