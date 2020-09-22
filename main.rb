require_relative 'LineAnalyzer'

my_file = File.open("ArquivoDeTextoGenerico.txt", "r")

#Array to store all instances of the Class
analyzers_arr = Array.new

my_file.each_with_index { |value, idx| 
  if value != "\n" #skip blank lines
    analyzers_arr.push(LineAnalyzer.new(idx+1, value))
  end
}

analyzers_arr.each { |value|
  value.analyze_frequency(true) #providing true will use my own algorithm for tallying the word occurrences, instead of using built-in method tally.
  # value.analyze_frequency
}