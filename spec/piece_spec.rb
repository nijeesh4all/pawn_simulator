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

  it 'creates new piece' do
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
      allow(Direction).to receive(:new).and_return(direction_instance)
      allow(direction_instance).to receive(:left!)
    end

    it 'calls left in direction class' do
      subject.left
      expect(direction_instance).to have_received(:left!)
    end
  end

  describe '#right' do
    before do
      allow(Direction).to receive(:new).and_return(direction_instance)
      allow(direction_instance).to receive(:right!)
    end

    it 'calls right in direction class' do
      subject.right
      expect(direction_instance).to have_received(:right!)
    end
  end

  describe '#report' do
    it 'returns the current piece status' do
      expect(subject.report).to eq('0, 0, east, black')
    end
  end

  describe '#move_to' do
    it 'moved the piece to current location' do
      expect {
        subject.move_to(1, 2)
      }.to change { subject.x }.from(0).to(1)
       .and change { subject.y }.from(0).to(2)
    end
  end

  describe '#has_moved?' do
    it 'returns false' do
      expect(subject.has_moved?).to eq(false)
    end

    context 'if the piece has moved' do
      it 'returns true' do
        subject.move_to(1,1)
        expect(subject.has_moved?).to eq(true)
      end
    end
  end
end
