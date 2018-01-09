require 'rails_helper'

RSpec.describe PeeLog, type: :model do
  it_behaves_like 'have .model_name.human', '💧'
  it_behaves_like 'have diaper_usage enum'
end
