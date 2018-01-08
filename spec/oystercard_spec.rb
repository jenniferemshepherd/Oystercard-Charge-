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

    it 'raises error when topup would exceed limit' do
      error = "This topup would exceed £#{Oystercard::BALANCE_LIMIT}"
      expect { card.topup(200) } .to raise_error error
    end

  end

  describe '#deduct' do

    it 'deducts amount from balance' do
      card.topup(30)
      expect{ card.deduct(2) }.to change{ card.balance }.by -2
    end

  end

end
