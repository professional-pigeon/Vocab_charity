require 'pry'

class Word
  attr_reader :word, :id
  @@words = {}
  @@word_id = 0

  def initialize(attributes, id)
    @word = attributes.fetch(:word)
    @id = id || @@word_id += 1
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new({:word => self.word}, self.id)
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
    defintions_to_delete = Definition.find_by_word(self.id)
    defintions_to_delete.each do |definition|
      definition.delete
    end
  end

  def self.find(id)
    @@words[id]
  end

  def update(word)
    @word = word
  end

  def definitions
    Definition.find_by_word(self.id)
  end
end