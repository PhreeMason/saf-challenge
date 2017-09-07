require_relative '../config/environment'

puts "Hi, I am your returns analyst"
puts "Please enter the name of the text file containing your data"

filename =  gets.chomp

begin # following block ensures that input is a file name
    analysis = ReturnsAnalyzer.new_from_file_input(filename)
   if analysis
   	  puts ""
      puts "File opened successfully"
   end
rescue
  puts "This file failed to open. Please re-enter the filename"
  filename = gets.chomp
  retry
end


puts "Here is a summary of your data: "
puts ""

puts analysis.formatted_summary

puts ""

puts "Goodbye"