require 'rails_helper'

RSpec.describe '/baby routing', type: :routing do
  specify do
    expect(get: '/baby/2018/1/5').to route_to(controller: 'baby_logs', action: 'index', year: '2018', month: '1', mday: '5')
    expect(get: '/baby/2018/01/01').to route_to(controller: 'baby_logs', action: 'index', year: '2018', month: '01', mday: '01')
    expect(get: '/baby/2018/12/31').to route_to(controller: 'baby_logs', action: 'index', year: '2018', month: '12', mday: '31')
    expect(get: '/baby/218/1/1').not_to be_routable
    expect(get: '/baby/20180/1/1').not_to be_routable
    expect(get: '/baby/2018/123/1').not_to be_routable
    expect(get: '/baby/2018/1/123').not_to be_routable
    expect(get: '/baby/二〇一八/一月/元旦').not_to be_routable
  end
end