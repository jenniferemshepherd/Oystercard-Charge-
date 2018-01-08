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

  describe '#in_journey?' do

    it { is_expected .to respond_to(:in_journey?) }

    it 'returns false after initialization' do
      expect(card.in_journey?).to eq false
    end

  end

  describe '#touch_in' do

    it 'sets journey status to true' do
      card.topup(1)
      card.touch_in
      expect(card).to be_in_journey
    end

    it 'raises error when balance is below minimum charge' do
      error = "Balance is below the minimum fare of £#{Oystercard::MINIMUM_FARE}"
      expect { card.touch_in } .to raise_error error
    end

  end

  describe '#touch_out' do

    it 'sets journey status to false' do
      card.topup(1)
      card.touch_in
      card.touch_out
      expect(card).not_to be_in_journey
    end

    it 'deducts minimum amount from balance on touch out' do
      card.topup(30)
      fare = Oystercard::MINIMUM_FARE
      expect { card.touch_out } .to change { card.balance } .by -fare
    end

  end

end
