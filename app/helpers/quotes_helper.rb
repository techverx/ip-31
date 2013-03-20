module QuotesHelper
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'
  def importquotess(cat,auth)
    allquotes= []
    url ="http://www.brainyquote.com/quotes/topics/topic_#{cat}"
    doc=Nokogiri::HTML(open(url))

    var=1
    doc.css(".boxyPaddingBig").each do |i|
      if (i.css(".bodybold a").text == auth)
        #puts i.css(".bqQuoteLink a").text+ "\n" + i.css(".bodybold a").text+ " \n \n"
        allquotes << i.css(".bqQuoteLink a").text
      end
      var=var+1
    end
    allquotes
  end

end
