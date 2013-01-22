#Jordan and Erik
#w3d2

require 'rspec'
require_relative 'reversi'

describe Board do
  describe "#build_board" do
    it "has 8 rows" do
      length.should eq(8)
    end

    it "has 8 squares in a row" do
      each do |row|
        row.length.should eq(8)
      end
    end
  end
end