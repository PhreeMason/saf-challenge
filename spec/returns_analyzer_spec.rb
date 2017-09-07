require 'spec_helper'

RSpec.describe ReturnsAnalyzer do
  let(:analysis){ReturnsAnalyzer.new_from_file_input("spec/fixtures/input_one.txt")}
  
  context 'Reading Input from a File' do
    it 'accepts a file path for an input file' do
      expect(analysis.file_name).to eq('input_one.txt')
    end

    it 'reads the contents of the file' do
      fixture_file_contents = File.read("spec/fixtures/input_one.txt")

      expect(analysis.file_contents).to eq(fixture_file_contents)
    end
  end

  context 'Parsing Input Data' do
    it 'names the fund' do
      expect(analysis.fund_name).to eq("Bloomberg Barclays US Aggregate Bond TR USD")
    end

    it 'has the year of the data' do
      expect(analysis.fund_year).to eq("2016")
    end

    it 'has the performance data' do
      expect(analysis.fund_performance).to eq([1.38, 0.71, 0.92, 0.38, 0.03, 1.80, 0.63, -0.11, -0.06, -0.76, -2.37, 0.14])
    end
  end

  context 'Analyzing the Data' do
    describe '#cumulative_returns' do
      it 'returns a decimal percentage' do
        expect(analysis.cumulative_returns).to eq(2.66)
      end

      it 'returns a formatted string decimal percentage' do
        expect(analysis.formatted_cumulative_returns).to eq('2.66%')
      end
    end

    describe '#positive_months_percent' do
      it 'returns a decimal percentage' do
        expect(analysis.positive_months_percent).to eq(66.67)
      end

      it 'returns a formatted string decimal percentage' do
        expect(analysis.formatted_positive_months_percent).to eq('66.67%')
      end
    end

    describe '#best_month' do
      it 'returns a decimal percentage' do
        expect(analysis.best_month).to eq(1.80)
      end

      it 'returns a formatted string decimal percentage' do
        expect(analysis.formatted_best_month).to eq('1.80%')
      end
    end
  end
end