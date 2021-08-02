require "rspec"
require "pry"
require "word"

describe ('#Word') do

  before(:each) do
    Word.clear
    @word1 = Word.new({:word => "ubiquitous"}, nil)
    @word1.save
    @word2 = Word.new({:word => "murmors",}, nil)
    @word2.save
  end
  
  describe('#save') do
    it("saves an instance of word to the Word class") do
      expect(Word.all).to(eq([@word1, @word2]))
    end
  end

  describe('#==') do
    it("allows an instance to be equal if the name is the same") do
    word3 = Word.new({:word => "ubiquitous"}, nil)
    word3.save
    expect(@word1).to(eq(word3))
    end
  end

  describe('.clear') do
    it("allows an instance to be equal if the name is the same") do
    Word.clear
    expect(Word.all).to(eq([]))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
    @word1.delete
    expect(Word.all).to(eq([@word2]))
    end
  end

  describe('.find') do
    it("finds a word in the @@word hash by it's id") do
    expect(Word.find(@word1.id)).to(eq(@word1))
    end
  end

  describe('#update') do
    it("updates a word in the @@word hash by it's id") do
    @word1.update("Juice")
    expect(@word1.word).to(eq("Juice"))
    end
  end

describe('#meanings') do
    it("returns a words meanings") do
      @definition1 = Definition.new({:meaning => "to be defined", :word_id => @word1.id}, nil)
      @definition1.save
      @definition2 = Definition.new({:meaning => "to be thought about", :word_id => @word1.id}, nil)
      @definition2.save
      expect(@word1.meanings).to(eq([definition1, definition2]))
    end
  end


end