require "test_helper"

class OptionMaxPainTest < Minitest::Test
  def test_that_it_can_calculate_max_pain
    options = {
      7700 => {call: 1823400, put: 5783025},
      7800 => {call: 3448575, put: 4864125},
      7900 => {call: 5367450, put: 2559375}
    }
    assert_equal 438277500, ::OptionMaxPain::Calculator.calculate_max_pain(options) 
  end
end
