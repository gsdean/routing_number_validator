# encoding: UTF-8
require 'spec_helper'

class TestBilling < TestModel
  validates :routing_number, :routing_number => true
end

class TestBillingAllowsNil < TestModel
  validates :routing_number, :routing_number => {:allow_nil => true}
end

class TestBillingAllowsNilFalse < TestModel
  validates :routing_number, :routing_number => {:allow_nil => false}
end

class TestBillingWithMessage < TestModel
  validates :routing_number_and_stuff, :routing_number => {:message => 'is not looking very good!'}
end

describe RoutingNumberValidator do
  let(:valid_routing_number) { "021000021" }
  let(:invalid_routing_number) { "991000021" }
  describe "validation" do
    context "with valid routing number" do
      it "is valid" do
        expect(TestBilling.new(:routing_number => valid_routing_number)).to be_valid
      end
    end

    context "with invalid routing number" do
      it "is invalid" do
        expect(TestBilling.new(:routing_number => invalid_routing_number)).not_to be_valid
      end
    end

  end
end
