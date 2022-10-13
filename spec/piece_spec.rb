# frozen_string_literal: true

require_relative 'spec_helper'

describe Piece do
  subject do
    described_class.new(location[:x],
                        location[:y],
                        direction,
                        color)
  end

  let(:location) { { x: 0, y: 0 } }
  let(:direction) { :east }
  let(:color) { :black }

  let!(:direction_instance) { instance_double(Direction) }

  before do
    allow(Direction).to receive(:new).and_return(direction_instance)
  end

  it 'creates new direction' do
    expect(subject).to be_an_instance_of(described_class)
  end

  context 'when color is invalid' do
    let(:color) { :invisible }

    it 'raises error' do
      expect {
        subject
      }.to raise_error Errors::InvalidPieceColor
    end
  end

  describe '#left' do
    before do
      allow(direction_instance).to receive(:left!)
    end

    it 'calls left in direction class' do
      subject.left
      expect(direction_instance).to have_received(:left!)
    end
  end

  describe '#right' do
    before do
      allow(direction_instance).to receive(:right!)
    end

    it 'calls right in direction class' do
      subject.right
      expect(direction_instance).to have_received(:right!)
    end
  end
end
