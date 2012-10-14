require 'spec_helper'

describe User do
  it { should validate_presence_of(:name) }
  it { should validate_format_of(:email).to_allow('kuchbhi@railsrumble.com').not_to_allow('kuchbhi@@railsrumble.com')}

  it { should have_many(:ads).with_dependent(:destroy) }
  it { should have_many(:ad_views).with_dependent(:destroy) }
end
