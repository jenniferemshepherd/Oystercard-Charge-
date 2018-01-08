require 'oystercard'

describe Oystercard do
  subject(:card) { Oystercard.new }

  it 'has an initial balance of zero' do
    expect(card.balance).to eq 0
  end

  describe '#topup' do

    it 'increments balance by amount' do
      expect{ card.topup(10) }.to change{ card.balance }.by 10
    end

  end

end
