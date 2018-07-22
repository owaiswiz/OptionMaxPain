require "test_helper"

class OptionMaxPainNseCalculatorTest < Minitest::Test
  def test_that_it_can_calculate_max_pain_of_specified_stock
    result_hash = {7800 => 438277500}
    assert_equal result_hash, ::OptionMaxPain::NseCalculator.calculate_max_pain('HEROMOTOCO') 
  end
end
