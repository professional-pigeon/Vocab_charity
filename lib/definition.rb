require 'pry'

class Definition
  attr_reader :word_id, :meaning, :id
  @@meanings = {}
  @@id = 0

  def initialize(attributes, id)
    @meaning = attributes.fetch(:meaning)
    @id = id ||@@id += 1
    @word_id = attributes.fetch(:word_id)
  end

  def self.all
    @@meanings.values()
  end


  def save
    @@meanings[self.id] = Definition.new({:meaning => self.meaning, :word_id => self.word_id}, self.id)
  end


  def ==(meaning_to_compare)
    self.meaning == meaning_to_compare.meaning
  end

  def self.clear
    @@meanings = {}
    @@id = 0
  end

  def delete
    @@meanings.delete(self.id)
  end

end