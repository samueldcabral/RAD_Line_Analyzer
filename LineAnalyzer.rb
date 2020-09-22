class LineAnalyzer

  @most_words = Array.new
  attr_accessor :line_number, :content, :most_words

  def initialize(num, cont)
    @line_number = num
    @content = cont
  end

  def analyze_frequency(my_algo = false)
    most_words_temp = Array.new
    content_arr = @content.split
    
    #providing true in my_algo will use my own algorithm for tallying the word occurrences, instead of using built-in method tally.
    if(my_algo)
      #My own algorithm
      max_occurrence_tally = tally_ocurrences(content_arr)
    else
      #Tally method tallies the word ocurrences in the content_arr and saves it in a hash
      max_occurrence_tally = content_arr.tally
    end

    #Grab the max number of ocurrencies and stores it in a variable
    max_occurrence_num = max_occurrence_tally.values.max 

    #Push the word or words that match the max number of occurrences
    content_arr.tally.each{ |key, value| 
      if value == max_occurrence_num 
        most_words_temp.push(key)
      end
    }

    #Just to save it in the class attr
    @most_words = most_words_temp

    #tenary operator just to make it pretty
    word_or_words = @most_words.length > 1 ? "words" : "word"
    is_are = @most_words.length > 1 ? "are" : "is"

    p "The most frequent #{word_or_words} in line #{@line_number} #{is_are} [#{@most_words.join(" - ")}] with #{max_occurrence_num} occurrences"
  end

  def tally_ocurrences(content_arr)
    seen = Hash.new

    content_arr.each{ |value|
      seen.has_key?(value) ? seen.store(value, seen[value] += 1) : seen[value] = 1
    }

    return seen
  end
end
