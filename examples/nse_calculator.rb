require 'option_max_pain'

class String
  # colorization monkey patch
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end 

  def blue
    colorize(34)
  end

  def light_blue
    colorize(36)
  end
end

while true
  begin
    puts "----- Calculate Option Max Pain - NSE, India -----".blue
    puts "Enter Stock Symbol as on NSE's Website (Eg. NIFTY or HEROMOTOCO), press Ctrl+C to exit".light_blue
    max_pain = OptionMaxPain::NseCalculator.calculate_max_pain(gets.chomp.upcase)
    strike = "Rs #{max_pain[0].to_s}".green
    loss = "Rs #{max_pain[1].to_s}".red
    puts "\nThe min loss to option writers is at the strike #{strike}.\nThe loss to option writers if market expired right now at this strike is #{loss}"
  rescue SystemExit, Interrupt
    exit
  rescue 
    puts "Error occurred while calculating option pain, Please make sure you entered the correct symbol\n".red
  end
  puts "\n\n"
end
