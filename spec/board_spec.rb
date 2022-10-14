require "ostruct"

require_relative './spec_helper'

describe Board do
  context 'when condition' do
    subject { described_class.new }

    it 'creates new board' do
      expect(subject).to be_an_instance_of(described_class)
    end

    it 'sets column as 8' do
      expect(subject.columns).to eq(8)
    end

    it 'sets rows as 8' do
      expect(subject.rows).to eq(8)
    end

    context 'when custom number rows and columns are given' do
      subject { described_class.new(rows, columns) }

      let(:rows) { 10 }
      let(:columns) { 10 }

      it 'sets column as 8' do
        expect(subject.columns).to eq(columns)
      end

      it 'sets rows as 8' do
        expect(subject.rows).to eq(rows)
      end
    end

    describe "#place_piece" do
      let(:piece) { OpenStruct.new({x: 0, y: 1}) }

      it 'places the piece' do
        expect { subject.place_piece(piece) }.to change { subject.instance_variable_get('@pieces').length }.by 1
      end

      context 'when piece is placed outside the board' do
        it 'raises error when placed below origin' do
          piece = OpenStruct.new({x: 0, y: -1})
          expect {
            subject.place_piece piece
          }.to raise_error Errors::CantPlacePieceError
        end

        it 'raises error when placed outside boundary' do
          piece = OpenStruct.new({x: subject.rows + 1, y: 0})
          expect {
            subject.place_piece piece
          }.to raise_error Errors::CantPlacePieceError
        end
      end
    end
  end
end
