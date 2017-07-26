class ClassificationFund
  # < ActiveRecord::Base

  attr_accessor :code, :name, :net_value_today, :accumulative_value_today,
                :net_value_yesterday, :accumulative_value_yesterday,
                :increased_value, :increased_rate, :market_price, :rate, :fee,
                :surplus_rate

  def surplus_rate_str
    unless @surplus_rate.nil?
      @surplus_rate.round(3)
    end
  end

  def self.fetch_data
    # http://fund.eastmoney.com/Data/Fund_JJJZ_Data.aspx?&letter=&gsid=0&text=&sort=dwjz,desc&page=1,442&dt=1433596756999&atfc=
    uri = URI('http://fund.eastmoney.com/Data/Fund_JJJZ_Data.aspx?')

    params = {
        :t => 1,
        :lx => 9,
        :letter => '',
        :gsid => 0,
        :text => '',
        :sort => 'dwjz,desc',
        :page => '1,500',
        :dt => DateTime.now.strftime('%Q'),
        :atfc => ''
    }

    request = Net::HTTP::Get.new(uri.path + '?' + params.collect { |k, v| "#{k}=#{CGI::escape(v.to_s)}" }.join('&'))
    request['accept-encoding'] ='none'

    http = Net::HTTP.new(uri.host, 80)
    http.use_ssl = false

    response = http.request(request)
    data = response.body.to_s[/\[\[.+\]\]/]

    parsed_json = ActiveSupport::JSON.decode(data)    
    classification_fund_set_array = ClassificationFundSet.init_fund_set_array
    
    parsed_json.each do |r|
      classification_fund_set_array.each do |s|
        f = nil
        if s.parent_fund.code == r[0]
          f = s.parent_fund
        elsif s.fund_a.code == r[0]
          f = s.fund_a
        elsif s.fund_b.code == r[0]
          f = s.fund_b
        end

        unless f.nil?
          f.name = r[1]
          f.net_value_today = r[3]
          f.accumulative_value_today = r[4]
          f.net_value_yesterday = r[5]
          f.accumulative_value_yesterday = r[6]
          f.increased_value = r[7]
          f.increased_rate = r[8] # this value is %
          f.market_price = r[9]
          f.rate = r[10]
        end
      end
    end

    classification_fund_set_array.each do |s|
      s.calc_surplus_rate
    end

    classification_fund_set_array.sort_by! { |s| s.parent_fund.surplus_rate || 0}.reverse
  end

end