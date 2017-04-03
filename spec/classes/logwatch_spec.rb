require 'spec_helper'

describe 'logwatch', :type => :class do
  # use default params but get it defined
  let (:params) {{}}

  it { should contain_class('logwatch::params') }
  it { should contain_class('logwatch::install') }
  it { should contain_class('logwatch::config') }

  it do
    should contain_package('logwatch').with({
      :ensure => 'present',
      :name   => 'logwatch',
    })
  end

  it do
    should contain_file('logwatch.conf').with({
      'ensure' => 'file',
      'path'   => '/etc/logwatch/conf/logwatch.conf',
      'owner'  => 'root',
      'group'  => 'root',
      'mode'   => '0644',
    })
  end

  it 'should not have a config file if ensure => absent' do
    params.merge!({ :package_ensure => 'absent' })
    should_not contain_file('logwatch.conf')
  end
end
