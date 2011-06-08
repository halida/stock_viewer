require 'sqlite3'
require 'date'

def create_tests
  Stock.delete_all
  Record.delete_all

  def rand_p price
    (rand - 0.5) * price / 10.0
  end

  def randrange l, h
    l + (h - l) * rand
  end

  [['GOOL', 100.0], ['MS', 50.0], ['FB', 80.0]].each do |name, price|
    stock = Stock.create!(:name => name)
    p = price

    startt = Time.new(2001, 1, 1).to_i
    (1..100).each do |i|
      next_p = p + rand_p(price)
      h = p + price/20.0 + rand_p(price)
      l = p - price/20.0 - rand_p(price)
      stock.records.create!(
                            :interval => 'minute',
                            :start => Time.at(startt + 60 * i),
                            :o => randrange(l, h),
                            :c => randrange(l, h),
                            :h => h,
                            :l => l,
                            )  
      p = next_p
    end
  end
end

create_tests
