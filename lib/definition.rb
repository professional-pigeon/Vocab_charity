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

  def self.find(id)
    @@meanings[id]
  end

  def update(meaning)
    @meaning = meaning
  end

  def self.find_by_word(word_id)
    meanings = []
    @@meanings.values.each do |meaning|
      if meaning.word_id == word_id
        meanings.push(meaning)
      end
    end
    meanings
  end

end