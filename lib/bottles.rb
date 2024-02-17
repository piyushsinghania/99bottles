class Bottles
  def verse(count)
    generate_verse(count)
  end

  def verses(high, low)
    phrase = verse(high)

    (low..(high - 1)).to_a.reverse.each do |count|
      phrase = append_phrase(phrase, verse(count))
    end

    phrase
  end

  def song
    verses(99, 0)
  end

  private

  def generate_verse(count)
    case count
    when 3..99
      <<~VERSE
        #{count} bottles of beer on the wall, #{count} bottles of beer.
        Take one down and pass it around, #{count - 1} bottles of beer on the wall.
      VERSE
    when 2
      <<~VERSE
        #{count} bottles of beer on the wall, #{count} bottles of beer.
        Take one down and pass it around, #{count - 1} bottle of beer on the wall.
      VERSE
    when 1
      <<~VERSE
        #{count} bottle of beer on the wall, #{count} bottle of beer.
        Take it down and pass it around, no more bottles of beer on the wall.
      VERSE
    when 0
      <<~VERSE
        No more bottles of beer on the wall, no more bottles of beer.
        Go to the store and buy some more, 99 bottles of beer on the wall.
      VERSE
    else
      <<~VERSE
        Ran out of range!
      VERSE
    end
  end

  def append_phrase(phrase, new_phrase)
    <<~VERSE
      #{phrase.strip}

      #{new_phrase.strip}
    VERSE
  end
end
