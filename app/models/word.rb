class Word < ActiveRecord::Base


  def self.find_anagrams(string)
    letters = string.split(//)
    combinations = []
    letters.each do |letter|
    remaining = letters.select { |l| l != letter }
    combinations << letter + remaining.join('')
    combinations << letter + reverse_letters(remaining).join('')
  end

  anagrams = []
  combinations.each do |word|
    if Word.find_by_text(word).present?
      anagrams << word
    end
  end

  anagrams
end

def self.reverse_letters(letters)
  length = letters.length
  reversed_letters = Array.new(length)

  letters.each_with_index do |letter, index|
    reversed_letters[length - index - 1] = letter
  end

  reversed_letters
end

def self.three_letters?(input)
  if input.length == 3
    true
  else
    false
  end
end

def self.distinct_letters?(input)
  letter_array = input.chars
  unique_letters = letter_array.uniq
  if unique_letters.length < letter_array.length
    false
  else
    true
  end
end

def self.valid_input?(input)
  if three_letters?(input) && distinct_letters?(input)
    true
  else
    false
  end
end

end
