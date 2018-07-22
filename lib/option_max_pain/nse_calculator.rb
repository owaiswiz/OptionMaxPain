require 'open-uri'
require 'nokogiri'

module OptionMaxPain
  class NseCalculator < Calculator
    def self.calculate_max_pain(stock)
      page = Nokogiri::HTML open "https://www.nseindia.com/live_market/dynaContent/live_watch/option_chain/optionKeys.jsp?symbol=#{stock}"

      strike_col_index  = self.get_col_index page.css("th[title='Strike Price']").first
      put_oi_col_index  = self.get_col_index page.css("th[title='Open Interest']").last
      call_oi_col_index = self.get_col_index page.css("th[title='Open Interest']").first

    end

    def self.get_col_index(element)
      element.parent.element_children.index(element) + 1
    end
  end
end
