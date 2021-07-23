require "rspec"
require "pry"
require "word"

describe ('#Word') do
  
  describe('#save') do
    it("saves an instance of word to the Word class")
      word1 = Word.new("ubiquitous", "to be ever present", nil)
      word1.save
      expect(Word.all).to(eq([word1, word2]))
    end
  end
end