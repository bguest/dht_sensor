require 'spec_helper'

describe DhtStub do

  let(:dht_stub){DhtStub.new(22,4)}

  before do
    @logger = double()
  end

  describe '#new' do

    it 'should set type and pin' do
      dht_stub.type.should == 22
      dht_stub.pin.should == 4
    end

    it 'should log that pin and type are set' do
      @logger.expects(:debug).with('DHT Type --> 42')
      @logger.expects(:debug).with('DHT Pin  --> 3')
      DhtStub.new(42,3, logger: @logger)
    end
  end

  describe '#to_a' do
    it 'should respond with a temperature humidity array' do
     dht_stub.send(:humidity=,34)
     dht_stub.send(:temperature=,40)

     arry = dht_stub.to_a
     arry[0].should be_within(0.001).of(40)
     arry[1].should be_within(0.001).of(34)
    end
  end
end

