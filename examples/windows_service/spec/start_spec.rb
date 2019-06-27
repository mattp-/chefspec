require 'chefspec'

describe 'windows_service::start' do
  platform 'windows'

  describe 'starts a windows_service with an explicit action' do
    it { is_expected.to start_windows_service('explicit_action') }
    it { is_expected.to_not start_windows_service('not_explicit_action') }
  end

  describe 'starts a windows_service with attributes' do
    it { is_expected.to start_windows_service('with_attributes').with(pattern: 'pattern') }
    it { is_expected.to_not start_windows_service('with_attributes').with(pattern: 'bacon') }
  end

  describe 'starts a windows_service when specifying the identity attribute' do
    it { is_expected.to start_windows_service('identity_attribute') }
  end
end
