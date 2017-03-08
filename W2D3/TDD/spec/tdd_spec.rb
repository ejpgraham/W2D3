require 'tdd'
# require 'rspec'

describe "Array#my_uniq" do
  subject(:test_array) { [1, 2, 1, 3, 3] }

  it "returns an Array object" do
    expect(test_array.my_uniq).to be_an(Array)
  end

  it "returns a different Array object" do
    expect(test_array.my_uniq).not_to be(test_array)
  end

  it "does not call Array#uniq" do
    expect(test_array).not_to receive(:uniq)
    test_array.my_uniq
  end

  it "returns unique elements in the same order" do
    expect(test_array.my_uniq).to eq([1, 2, 3])
  end
end

describe "Array#two_sum" do
  subject(:test_array) { [-1, 0, 2, -2, 1] }
  let(:no_pair_array) { [1, 2, 3, 4] }

  it "returns an Array object" do
    expect(test_array.two_sum).to be_an(Array)
  end

  it "returns an empty array if called on an empty array" do
    expect([].two_sum).to be_empty
  end

  it "returns an empty array if no pairs found" do
    expect(no_pair_array.two_sum).to be_empty
  end

  it "sorts resulting pairs dictionary-wise and returns all pairs" do
    expect(test_array.two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe "Array#my_transpose" do
  subject(:test_array) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
  let(:one_el_array) {[[1]]}

  it "returns a 2D array" do
    expect(test_array.my_transpose[0][0]).to_not be_nil
  end

  it "returns the same array if square is 1x1" do
    expect(one_el_array.my_transpose).to be(one_el_array)
  end

  it "should return an array of the same dimensions" do
    expect(test_array.my_transpose.length).to eq(test_array.length)
    expect(test_array.my_transpose[0].length).to eq(test_array[0].length)
  end

  it "does not call Array#transpose" do
    expect(test_array).to_not receive(:transpose)
    test_array.my_transpose
  end

  it "transposes the array" do
    expect(test_array.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end

describe "#stock_picker" do
  subject(:test_array) { [55, 53, 56, 51, 59, 62, 41] }

  it "returns nil if input array length less than 2" do
    expect(stock_picker([])).to be_nil
    expect(stock_picker([1])).to be_nil
  end

  context "when profit exists" do

    it "returns an array of length 2" do
      expect(stock_picker(test_array).length).to eq(2)
    end

    it "index of first day is less than index of second day" do
      x, y = stock_picker(test_array)
      expect(x).to be < y
    end

    it "returns an array of the indices of the days that are most profitable" do
      expect(stock_picker(test_array)).to eq([3,5])
    end

  end

  context "when no profit exists" do

    it "returns an empty array when no profit is possible" do
      expect(stock_picker([5,1])).to be_empty
    end
  end
end

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }

  describe "#initialize" do
    describe "#towers" do
      it "returns an array of towers" do
        expect(game.towers).to be_an(Array)
        end

      it "towers should be an array of length 3" do
        expect(game.towers.length).to eq(3)
      end

      it "expects towers to be an array of arrays" do
        expect(game.towers[0]).to be_an(Array)
      end

      it "expects the first tower to be length 3" do
        expect(game.towers[0].length).to eq(3)
      end

      it "expects last 2 towers to be empty" do
        (1..2).each do |i|
          expect(game.towers[i]).to be_empty
        end
      end

      it "first tower is an array of 1, 2 ,3" do
        expect(game.towers[0]).to eq([1, 2, 3])
      end
    end
  end

  describe "#move" do
    it "raise error for trying to move a disc from empty tower" do
      expect { game.move(1, 2) }.to raise_error("starting tower empty")
    end

    it "raise error for trying to move a larger onto a smaller disc" do
      game.towers = [[2, 3], [1], []]
      expect { game.move(0, 1) }.to raise_error("can't move a larger disc on to a smaller disc")
    end

    it "moves a disk from one tower to another" do
      game.move(0, 1)
      expect(game.towers).to eq([[2, 3], [1], []])
      game.move(1, 0)
      expect(game.towers).to eq([[1, 2, 3], [], []])
    end
  end

  describe "#won?" do
    it "ends the game when tower 2 or tower 3 are full" do
      game.towers = [[], [1, 2, 3], []]
      expect(game.won?).to be_truthy
      game.towers = [[], [], [1, 2, 3]]
      expect(game.won?).to be_truthy
    end
  end
end
