require 'pry'

class Word
  attr_reader :word, :meaning, :id
  @@words = {}
  @@word_id = 0

  def initialize(attributes, id)
    @word = attributes.fetch(:word)
    @meaning = attributes.fetch(:meaning)
    @id = id || @@word_id += 1
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new({:word => self.word, :meaning => self.meaning}, self.id)
  end

  def ==(word_to_compare)
    self.word == word_to_compare.word
  end

  def self.clear
    @@words = {}
    @@word_id = 0
  end

  def delete
    @@words.delete(self.id)
  end

  def self.find(id)
    @@words[id]
  end

  def update(word, meaning)
    @word = word || @word
    @meaning = meaning || @meaning
  end


end