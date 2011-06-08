require 'sqlite3'
require 'date'

def create_tests
  Stock.delete_all
  Record.delete_all

  [['GOOL', 100.0], ['MS', 50.0], ['FB', 80.0]].each do |name, price|
    stock = Stock.create!(:name => name)

    (1..30).each do |i|
      stock.records.create!(
                            :interval => 'minute',
                            :start => DateTime.new(2011, 2, 3, 10, i),
                            :o => Integer(rand * 1000000),
                            :c => Integer(rand * 1000000),
                            :h => (i + rand) * price,
                            :l => (i - rand) * price,
                            )  
    end
  end
end

create_tests
