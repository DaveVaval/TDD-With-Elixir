defmodule ElevatorMediaTest do
  use ExUnit.Case
  doctest ElevatorMedia

  # This test will make sure that the game comes back in the right format
  test "getContent Game test for format" do
    streamer = %ElevatorMedia.Streamer{}
    assert ElevatorMedia.Streamer.getContent("game") == format(streamer.game)
  end

  # This test will make sure that the Cardano chart comes back in the right format
  test "getContent ada test for format" do
    streamer = %ElevatorMedia.Streamer{}
    assert ElevatorMedia.Streamer.getContent("ada") == format(streamer.ada)
  end

  # This test will check for a regex match with the value returned from getContent("quote data")
  test "getContent quote test for regex match" do
    assert Regex.match?(~r/<div>/, ElevatorMedia.Streamer.getContent("quote data"))
  end

  # This test will check if the get request status is Ok: 200
  test "getContent quote test for response status" do
    assert ElevatorMedia.Streamer.getContent("quote status") == 200
  end

  def format(data) do
    "<div> #{data} </div>"
  end

end
