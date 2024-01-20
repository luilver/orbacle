# frozen_string_literal: true

require 'spec_helper'

module Orbacle
  RSpec.describe 'Orbacle::VERSION' do
    subject { Object.const_get(self.class.description) }

    it { is_expected.to match(/^\d+\.\d+\.\d+(\.\w+(\.\d+)?)?$/) }
  end
end
