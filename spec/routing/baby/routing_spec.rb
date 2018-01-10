require 'rails_helper'

RSpec.describe '/baby routing', type: :routing do
  describe 'GET /baby/:year/:month/:day' do
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

  describe 'POST /baby/bath_logs' do
    specify do
      expect(post: '/baby/bath_logs').to route_to('bath_logs#create')
    end
  end

  describe 'POST /baby/breast_milk_logs' do
    specify do
      expect(post: '/baby/breast_milk_logs').to route_to('breast_milk_logs#create')
    end
  end

  describe 'POST /baby/milk_logs' do
    specify do
      expect(post: '/baby/milk_logs').to route_to('milk_logs#create')
    end
  end

  describe 'POST /baby/pee_logs' do
    specify do
      expect(post: '/baby/pee_logs').to route_to('pee_logs#create')
    end
  end

  describe 'POST /baby/poo_logs' do
    specify do
      expect(post: '/baby/poo_logs').to route_to('poo_logs#create')
    end
  end
end
