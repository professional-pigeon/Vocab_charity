require "rspec"
require "pry"
require "definition"

describe ('#definition') do

  describe('#save') do

    
    it("saves an instance of a definition to the definition class") do
      @def1 = Definition.new({:id => nil, :meaning => "to be defined", :word_id => 1})
      @def1.save
      @def2 = Definition.new({:id => nil, :meaning => "to be defined", :word_id => 1})
      @def2.save
      expect(Definition.all).to(eq([@def1, @def2]))
    end
  end

  # describe('#==') do
  #   it("allows an instance to be equal if the name is the same") do
  #   word3 = Word.new({:word => "ubiquitous", :meaning => "to be ever present"}, nil)
  #   word3.save
  #   expect(@word1).to(eq(word3))
  #   end
  # end

  # describe('.clear') do
  #   it("allows an instance to be equal if the name is the same") do
  #   Word.clear
  #   expect(Word.all).to(eq([]))
  #   end
  # end

  # describe('#delete') do
  #   it("deletes a word by id") do
  #   @word1.delete
  #   expect(Word.all).to(eq([@word2]))
  #   end
  # end

  # describe('.find') do
  #   it("finds a word in the @@word hash by it's id") do
  #   expect(Word.find(@word1.id)).to(eq(@word1))
  #   end
  # end

  # describe('#update') do
  #   it("updates a word in the @@word hash by it's id") do
  #   @word1.update("Juice", nil)
  #   expect(@word1.word).to(eq("Juice"))
  #   end
  # end


end