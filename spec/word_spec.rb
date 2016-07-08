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
end
