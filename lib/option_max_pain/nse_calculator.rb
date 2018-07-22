require 'open-uri'
require 'nokogiri'

module OptionMaxPain
  class NseCalculator < Calculator
    def self.calculate_max_pain(stock)
      page = Nokogiri::HTML open "https://www.nseindia.com/live_market/dynaContent/live_watch/option_chain/optionKeys.jsp?symbol=#{stock}"

      strike_col_index  = self.get_col_index page.css("th[title='Strike Price']").first
      put_oi_col_index  = self.get_col_index page.css("th[title='Open Interest']").last
      call_oi_col_index = self.get_col_index page.css("th[title='Open Interest']").first

      options = page.css('table#octable tr')[2..-2].collect do |row|
        { 
          row.elements[strike_col_index].text.gsub(',','').to_i => {
            call: row.elements[call_oi_col_index].text.gsub(',','').to_i,
            put:  row.elements[put_oi_col_index].text.gsub(',','').to_i
          }
        }
      end
      options

      super(options.reduce({}, :merge))
    end

    def self.get_col_index(element)
      element.parent.elements.index(element)
    end
  end
end
