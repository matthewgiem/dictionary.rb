require('rspec')
require('definition')

describe('Definition') do
  before() do
    Definition.clear()
  end

  describe('.all') do
    it('is empty at first') do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a definition in the class varible @@definitions') do
      test_definition = Definition.new({:definition => "growth in response to moonlight", :part_of_speech => "verb"})
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe('.clear') do
    it('will empty @@definitions when the clear singleton method is called') do
      test_definition = Definition.new({:definition => "hello in thai", :part_of_speech => "action verb"})
      test_definition.save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('#part_of_speech') do
    it('returns the part of speech for the givin word') do
      test_definition = Definition.new({:definition => "growth in response to moonlight", :part_of_speech => "verb"})
      expect(test_definition.part_of_speech()).to(eq("verb"))
      Definition.clear()
    end
  end

  describe('#definition') do
    it('returns the part of speech for the givin word') do
      test_definition = Definition.new({:definition => "growth in response to moonlight", :part_of_speech => "verb"})
      expect(test_definition.definition()).to(eq("growth in response to moonlight"))
      Definition.clear()
    end
  end

  describe('#id') do
    it('returns the id of the definition') do
      test_definition = Definition.new({:definition => "growth in response to moonlight", :part_of_speech => "verb"})
      test_definition.save()
      expect(test_definition.id()).to(eq(1))
    end
  end

describe('.find') do
  it('returns a definition by its id number') do
    test_definition = Definition.new({:definition => "growth in response to moonlight", :part_of_speech => "verb"})
    test_definition.save()
    test_definition2 = Definition.new({:definition => "hello in thai", :part_of_speech => "action verb"})
    test_definition2.save()
    expect(Definition.find(test_definition.id())).to(eq(test_definition))
  end
end


end
