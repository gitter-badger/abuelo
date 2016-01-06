require 'spec_helper'

RSpec.describe Abuelo::Node do

  let(:node) { described_class.new('node 1') }

  context 'initialization' do
    it 'sets object to nil if not given' do
      expect(node.object).to be nil
    end
  end

  context 'accessors' do
    it 'has following getters' do
      expect(node.respond_to?(:name)).to be true
      expect(node.respond_to?(:object)).to be true
      expect(node.respond_to?(:graph)).to be true
    end

    it 'has following setters' do
      expect(node.respond_to?(:graph=)).to be true
    end
  end

  describe '#edges' do
    it 'calls edges_for_node on its graph' do
      graph = Abuelo::Graph.new
      node.graph = graph
      expect(graph).to receive(:edges_for_node).with(node)
      node.edges
    end

    it 'responds with nil if the node has no associated graph' do
      expect(node.edges).to be nil
    end
  end

  describe '#to_s' do
    it 'responds with its name' do
      expect(node.to_s).to eq 'node 1'
    end
  end

  describe '#==(other)' do
    it 'is true when the names match' do
      other = Abuelo::Node.new('node 1')
      expect(node == other).to be true
    end

    it 'is false when the names do not match' do
      other = Abuelo::Node.new('node 2')
      expect(node == other).to be false
    end
  end
end
