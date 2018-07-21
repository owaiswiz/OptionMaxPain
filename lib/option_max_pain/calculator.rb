module OptionMaxPain
  class Calculator
    def self.calculate_max_pain(options)
      # options should be a hash with available strikes as keys that contains
      # a hash of its OI of call and put options
      # Eg =>
      # options = {7700 => {call: 2131, put: 1234}, 7800 => {call: 890, put: 8209183}}

      options_pain = {}
      sorted_strikes = options.keys.sort

      sorted_strikes.each_with_index do |strike, index| 
        loss_due_to_call = sorted_strikes[0..index].collect do |key|
          options[key][:call] * (strike - key)
        end.sum

        loss_due_to_put = sorted_strikes[index..-1].collect do |key|
          options[key][:put] * (key - strike)
        end.sum

        options_pain[strike] = loss_due_to_call + loss_due_to_put
      end
      [options_pain.min_by {|k,v| v}].to_h
    end
  end
end
