require "test_helper"

class OptionMaxPainNseCalculatorTest < Minitest::Test
  def test_that_it_can_get_col_indexes_properly
      page = Nokogiri::HTML open "https://www.nseindia.com/live_market/dynaContent/live_watch/option_chain/optionKeys.jsp?symbol=HEROMOTOCO"
      strike_col_index  = ::OptionMaxPain::NseCalculator.get_col_index page.css("th[title='Strike Price']").first
      put_oi_col_index  = ::OptionMaxPain::NseCalculator.get_col_index page.css("th[title='Open Interest']").last
      call_oi_col_index = ::OptionMaxPain::NseCalculator.get_col_index page.css("th[title='Open Interest']").first

      assert_equal 1, call_oi_col_index
      assert_equal 11, strike_col_index
      assert_equal 21, put_oi_col_index
  end

  def test_that_it_can_calculate_max_pain_of_specified_stock
    assert_equal Array, ::OptionMaxPain::NseCalculator.calculate_max_pain('HEROMOTOCO').class
    assert_equal Array, ::OptionMaxPain::NseCalculator.calculate_max_pain('NIFTY').class
  end
end
