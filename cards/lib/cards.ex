defmodule Cards do
  @moduledoc """
  provides methods for creating and handling a deck of cards.
  """


  @doc """
  Returns a list of cards in a deck.
  """
  def create_deck do
   values = ["Ace", "Two", "Three"]
   suits = ["Spades", "Clubs", "hearts", "Diamonds"]
   for suit <- suits, value <- values do
      "your #{value} of #{suit}"
   end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end


  @doc """
  Determines whether a deck contains a given card

  ## Examples

  
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  divides a deck into a hand and athe remainderof the deck.
  The hand_size argument indicates how


  ## Examples

   iex> deck = Cards.create_deck
   iex> {hand, deck} = Cards.deal(deck, 5)
   iex> hand
   ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  def load(file_name) do
    case File.read(file_name) do
      {:ok, binary } -> :erlang.binary_to_term binary
      {:error, _reason} -> "File not found"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
