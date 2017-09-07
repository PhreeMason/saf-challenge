class ReturnsAnalyzer 

  def self.new_from_file_input(path)
    file = File.open("#{Dir.pwd}/#{path}", "r")
    self.new(file)
  end

  def initialize(file)
    @file = file
  end

  def file_name
    @file_name ||= File.basename(@file.path) 
  end

  def file_contents
    @file_contents ||= @file.read
  end

  def fund_name
    @fund_name ||= file_contents.split(/\n/).first.strip
  end  

  def fund_year
    @fund_year ||= file_contents.split(/\n/)[1].strip
  end

  def fund_performance
    @fund_performance ||= file_contents.split(/\n/)[2].strip.split(",").map { |n| n.to_f }
  end

  def cumulative_returns
    return @cumulative_returns if @cumulative_returns
    result = fund_performance.reduce(1) do |sum, r|
      sum * (1 + r/100)
    end

    @cumulative_returns = (100 * (result - 1)).round(2)
  end

  def formatted_cumulative_returns
    "#{cumulative_returns}%"
  end
  
  def positive_months_percent
    return @positive_months_percent if @positive_months_percent
    result = fund_performance.select{|e| e > 0}.length.to_f/12
    
    @positive_months_percent ||= (result * 100).round(2)
  end

  def formatted_positive_months_percent
    "#{positive_months_percent}%"
  end

  def best_month
    @best_month ||= fund_performance.max 
  end

  def formatted_best_month
    "#{'%.2f' % best_month}%"
  end

  def formatted_summary
    puts "#{fund_name}"
    puts "Year: #{fund_year}"
    puts "Cumulative Return: #{formatted_cumulative_returns}"
    puts "% Positive Months: #{formatted_positive_months_percent}"
    puts "Best Month: #{formatted_best_month}"
  end

end  
