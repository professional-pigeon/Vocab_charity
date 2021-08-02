require 'pry'

class Definition
  attr_reader :word, :meaning, :id
  @@definitions = {}
  @@id = 0

  def initialize(attributes)
    @meaning = attributes.fetch(:meaning)
    @id = id ||@@id += 1
    @word_id = attributes.fetch(:word_id)
  end

  def self.all
    @@words.values()
  end

end