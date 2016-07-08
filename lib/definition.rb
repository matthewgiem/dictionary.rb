class Definition
  attr_reader(:part_of_speech, :definition)
  @@definitions = []

  define_method(:initialize) do |attributes|
    @part_of_speech = attributes.fetch(:part_of_speech)
    @definition = attributes.fetch(:definition)
    @id = @@definitions.length() + 1
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_singleton_method(:find) do |id|
    found_definition = nil
    @@definitions.each() do |definition|
      if definition.id().eql?(id)
        found_definition = definition
      end
    end
    found_definition
  end
end
