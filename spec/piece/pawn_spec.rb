# frozen_string_literal: true

require_relative '../spec_helper'

describe Piece::Pawn do
  subject do
    described_class.new(location[:x],
                        location[:y],
                        direction,
                        color)
  end

  let(:location) { { x: 0, y: 0 } }
  let(:direction) { :east }
  let(:color) { :black }

  describe '#valid_move?' do
    context 'when move is valid' do
      let(:location) { { x: 3, y: 3 } }

      it 'is possible to move up' do
        expect(subject.valid_move?(3, 4)).to eq(true)
      end

      it 'is possible to move down' do
        expect(subject.valid_move?(3, 2)).to eq(true)
      end

      it 'is possible to move left' do
        expect(subject.valid_move?(2, 3)).to eq(true)
      end

      it 'is possible to move right' do
        expect(subject.valid_move?(4, 3)).to eq(true)
      end
    end

    context 'invalid moves' do
      let(:location) { { x: 0, y: 0 } }

      it 'is not possible to move diagonally to left' do
        expect(subject.valid_move?(1, 1)).to eq(false)
      end

      it 'is not possible to move diagonally to bottom' do
        expect(subject.valid_move?(-1, -1)).to eq(false)
      end

    end
  end

  describe '#next_move' do
    let(:location) { { x: 2, y: 2 } }

    context 'when facing north' do
      let(:direction) { :north }

      it 'next move it one step up' do
        expect(subject.next_move).to match_array([2, 3])
      end
    end

    context 'when facing west' do
      let(:direction) { :west }

      it 'next move it one step left' do
        expect(subject.next_move).to match_array([1, 2])
      end
    end

    context 'when facing east' do
      let(:direction) { :east }

      it 'next move it one step right' do
        expect(subject.next_move).to match_array([3, 2])
      end
    end

    context 'when facing south' do
      let(:direction) { :south }

      it 'next move it one step down' do
        expect(subject.next_move).to match_array([2, 1])
      end
    end

  end
end
