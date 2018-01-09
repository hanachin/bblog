RSpec.shared_examples 'have .model_name.human' do |human_model_name|
  specify do
    expect(described_class.model_name.human).to eq(human_model_name)
  end
end
