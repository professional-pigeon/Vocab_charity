require 'pry'

class Definition
  attr_reader :word, :meaning, :id
  @@definitions = {}
  @@id = 0

  def initialize(attributes, id)
    @meaning = attributes.fetch(:meaning)
    @id = id ||@@id += 1
  end

  def self.all
    @@words.values()
  end

end