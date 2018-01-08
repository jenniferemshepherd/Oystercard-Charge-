require 'oystercard'

describe Oystercard do
  subject(:card) { Oystercard.new }

  it 'has an initial balance of zero' do
    expect(card.balance).to eq 0
  end
end
