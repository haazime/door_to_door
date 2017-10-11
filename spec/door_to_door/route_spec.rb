require 'spec_helper'
require 'ostruct'

FooController = Class.new

module Admin
  BarController = Class.new
end

RSpec.describe DoorToDoor::Route do
  let(:route) do
    described_class.new(app_route)
  end

  describe '#controller_class' do
    context 'FooController' do
      let(:app_route) do
        OpenStruct.new(controller: 'foo')
      end

      it do
        expect(route.controller_class).to eq(FooController)
      end
    end

    context 'Admin::BarController' do
      let(:app_route) do
        OpenStruct.new(controller: 'admin/bar')
      end

      it do
        expect(route.controller_class).to eq(Admin::BarController)
      end
    end
  end

  describe '#action' do
    let(:app_route) do
      OpenStruct.new(action: 'action')
    end

    it do
      expect(route.action).to eq('action')
    end
  end

  describe '#request' do
    let(:app_route) do
      OpenStruct.new(action: 'action', verb: 'VERB')
    end

    it do
      spy = RequestReceiverSpy.new
      route.request(spy)
      expect(spy.method).to eq('verb')
      expect(spy.action).to eq('action')
    end
  end
end
