require "rspec"
require "pry"
require "definition"
require "word"

describe ('#definition') do

  before(:each) do
    Definition.clear
    Word.clear
    @definition1 = Definition.new({:meaning => "to be defined", :word_id => 1}, nil)
    @definition1.save
    @definition2 = Definition.new({:meaning => "to be thought about", :word_id => 1}, nil)
    @definition2.save
  end

  describe('#save') do
    it("saves an instance of a definition to the definition class") do
      expect(Definition.all).to(eq([@definition1, @definition2]))
    end
  end

  describe('#==') do
    it("allows an instance to be equal if the name is the same") do
      def3 = Definition.new({:meaning => "We should be the same", :word_id => 1}, nil)
      def3.save
      def4 = Definition.new({:meaning => "We should be the same", :word_id => 1}, nil)
      def4.save
      expect(def3).to(eq(def4))
    end
  end


  describe('.clear') do
    it("clears all instances of defintion attached to the definition class") do
    Definition.clear
    expect(Word.all).to(eq([]))
    end
  end

  describe('#delete') do
    it("deletes a meaning by it's id") do
    @definition1.delete
    expect(Definition.all).to(eq([@definition2]))
    end
  end

  describe('.find') do
    it("finds a definition in the @@definition hash by it's id") do
    expect(Definition.find(@definition1.id)).to(eq(@definition1))
    end
  end

  describe('#update') do
    it("updates a definition in the @@definition hash by it's id") do
    @definition1.update("A new definition")
    expect(@definition1.meaning).to(eq("A new definition"))
    end
  end

  describe('.find_by_word') do
    it("finds a definition in the @@definition hash by it's id") do
    expect(Definition.find_by_word(@definition1.word_id)).to(eq([@definition1, @definition2]))
    end
  end

  describe('#word') do
    it("returns the word a meaning belongs to") do
      @word1 = Word.new({:word => "ubiquitous"}, nil)
      @word1.save
      expect(@definition1.word).to(eq(@word1))
    end
  end


end