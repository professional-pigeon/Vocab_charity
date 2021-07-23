class Word
  attr_reader :word, :meaning, :id
  @@words = {}
  @@word_id = 0

  def initialize (word, meaning, id)
    @word = word
    @meaning = meaning
    @id = id || @@word_id += 1
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new(self.word, self.meaning, self.id)
  end

  def ==(word_to_compare)
    self.word == word_to_compare.word
  end

  def self.clear
    @@words = {}
    @@word_id = 0
  end

end