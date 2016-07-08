class Word
  @@words = []

  define_method(:initialize) do |word|
    @word = word
    @id = @@words.length(). + 1
    @definition = []
  end
end
