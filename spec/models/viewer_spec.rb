require 'spec_helper'

describe Viewer do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:ad) }

  it { should belong_to(:user) }
  it { should belong_to(:ad) }
end
