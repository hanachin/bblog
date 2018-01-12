require 'rails_helper'

RSpec.describe 'root routing', type: :routing do
  specify do
    expect(get: '/').to route_to(controller: 'babies', action: 'new')
  end
end
