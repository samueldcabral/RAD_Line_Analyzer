require_relative 'LineAnalyzer'

my_file = File.open("ArquivoDeTextoGenerico.txt", "r")

analyzers_arr = Array.new

my_file.each_with_index { |value, idx| 
  
  if value.length > 1 #check if line isnt blank
    analyzers_arr.push(LineAnalyzer.new(idx+1, value))
  end
}

analyzers_arr.each {
  |value|

  if value.line_number == 1
    value.analyze_frequency
  end
}