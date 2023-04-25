defmodule BasketballWebsite do

  def extract_from_path(data, path) do
    paths = String.split(path, ".")
    extract_from_paths(data, paths)
  end

  def extract_from_paths(nil, paths), do: nil

  def extract_from_paths(data, []), do: data

  def extract_from_paths(data, [curr | rest]) do
    extract_from_paths(data[curr], rest)
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
