require "rspec"
require "pry"
require "word"

describe ('#Word') do
  
  describe('#save') do
    it("saves an instance of word to the Word class") do
      word1 = Word.new("ubiquitous", "to be ever present", nil)
      word1.save
      word2 = Word.new("murmors", "a soft sound made by people speaking quietly or far away", nil)
      word2.save
      expect(Word.all).to(eq([word1, word2]))
    end
  end

  describe('#==') do
    it("allows an instance to be equal if the name is the same") do
    word1 = Word.new("ubiquitous", "to be present or appearing everywhere", nil)
    word1.save
    word3 = Word.new("ubiquitous", "not to be compared", nil)
    word3.save
    expect(word1).to(eq(word3))
    end
  end

  describe('.clear') do
    it("allows an instance to be equal if the name is the same") do
    word1 = Word.new("ubiquitous", "to be present or appearing everywhere", nil)
    word1.save
    word2 = Word.new("murmurs", "quiet talking by people either near or far", nil)
    word2.save
    Word.clear
    expect(Word.all).to(eq([]))
    end
  end


end