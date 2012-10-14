require 'spec_helper'

describe Ad do
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:category) }
  it { should validate_numericality_of(:price).greater_than(0) }

  it { should belong_to(:user) }
  it { should belong_to(:category) }
  it { should have_many(:tags) }
  it { should have_many(:views).with_dependent(:destroy) }
  it { should have_many(:images).with_dependent(:destroy) }
end
