# frozen_string_literal: true

require_relative './spec_helper'

describe Direction do
  subject { described_class.new(direction) }

  let(:direction) { :east }

  it 'creates new direction' do
    expect(subject).to be_an_instance_of(described_class)
  end

  context 'when direction is invalid' do
    let(:direction) { :no_where }

    it 'raises exception' do
      expect{
        subject
      }.to raise_error Errors::InvalidDirectionError
    end
  end

  describe '#left!' do
    it 'rotates the pawn to left' do
      subject.left!
      expect(subject.direction).to eq(:south)
    end

    context 'when direction is north' do
      let(:direction) { :north }

      it 'rotate the pawn to face east' do
        subject.left!
        expect(subject.direction).to eq(:east)
      end
    end
  end

  describe '#right!' do
    it 'rotates the pawn to left' do
      subject.right!
      expect(subject.direction).to eq(:north)
    end

    context 'when direction is north' do
      let(:direction) { :north }

      it 'rotate the pawn to face west' do
        subject.right!
        expect(subject.direction).to eq(:west)
      end
    end

  end

end
