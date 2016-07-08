class Word
  @@words = []

  define_method(:initialize) do |word|
    @word = word
    @id = @@words.length(). + 1
    @definition = []
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_method(:save) do
    if self != ''
      @@words.push(self)
    end
  end

  define_method(:id) do
    @id
  end

  define_method(:name) do
    @word
  end

  define_singleton_method(:all) do
    @@words
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@words.each() do |word|
      if word.id().eql?(id)
        found_word = word
      end
    end
    found_word
  end
end
