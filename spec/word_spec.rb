require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

  describe('#word') do
    it('return the word thats in the dictionary') do
      test_word = Word.new("human")
      expect(test_word.name()).to(eq("human"))
    end
  end

  describe('#id') do
    it('returns the id of the word') do
      test_word = Word.new("what")
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it('saves a word in the class variable @@word') do
      test_word = Word.new("world")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".clear") do
    it('will empty @@words when the empty singleton method is called') do
      test_word = Word.new("hello")
      test_word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a dealership by its id number") do
      test_word = Word.new("kitty")
      test_word.save()
      test_word2 = Word.new("japan")
      test_word2.save()
      expect(Word.find(test_word2.id())).to(eq(test_word2))
    end
  end

  
end
