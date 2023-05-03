defmodule PaintByNumber do

  def get_log2(x) when x <= 1, do: 1

  def get_log2(x) do
    get_log2(div(x, 2)) + 1
  end

  def palette_bit_size(color_count) do
    get_log2(color_count-1)
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bit_size = palette_bit_size(color_count)
    <<pixel_color_index::size(bit_size), picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) when picture == <<>>, do: nil

  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<pixel::size(bit_size), _::bitstring>> = picture
    pixel
  end

  def drop_first_pixel(picture, _) when picture == <<>>, do: picture
  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<_::size(bit_size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
