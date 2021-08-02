require 'pry'

class Definition
  attr_reader :word_id, :meaning, :id
  @@definitions = {}
  @@id = 0

  def initialize(attributes, id)
    @meaning = attributes.fetch(:meaning)
    @id = id ||@@id += 1
    @word_id = attributes.fetch(:word_id)
  end

  def self.all
    @@definitions.values()
  end


  def save
    @@definitions[self.id] = Definition.new({:meaning => self.meaning, :word_id => self.word_id}, self.id)
  end


  def ==(meaning_to_compare)
    self.meaning == meaning_to_compare.meaning
  end

  def self.clear
    @@definitions = {}
    @@id = 0
  end

end