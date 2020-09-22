class LineAnalyzer

  @most_words = []

  attr_accessor :line_number, :content, :most_words

  def initialize(num, cont)
    @line_number = num
    @content = cont
  end

  def analyze_frequency
    content_arr = @content.split

    content_arr.each{ |value|  
      p value
    }
  end

end
