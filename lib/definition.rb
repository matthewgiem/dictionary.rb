class Definition
  attr_reader(:part_of_speech, :definition)

  define_method(:initialize) do |attributes|
    @part_of_speech = attributes.fetch(:part_of_speech)
    @definition = attributes.fetch(:definition)
  end
end
