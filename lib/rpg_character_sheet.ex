defmodule RPG.CharacterSheet do
  @welcome_msg "Welcome! Let's fill out your character sheet together."
  @name_msg "What is your character's name?\n"
  @class_msg "What is your character's class?\n"
  @level_msg "What is your character's level?\n"

  def take_input(msg) do
    IO.gets(msg)
    |> String.trim
  end

  def welcome() do
    IO.puts @welcome_msg
    :ok
  end

  def ask_name() do
    take_input @name_msg
  end

  def ask_class() do
    take_input @class_msg
  end

  def ask_level() do
    level = take_input @level_msg
    level
    |> String.to_integer
  end

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    data = %{
      name: name,
      class: class,
      level: level
    }
    IO.puts("Your character: " <> inspect(data))
    data
  end
end
