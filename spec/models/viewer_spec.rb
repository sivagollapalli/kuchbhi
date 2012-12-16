require 'spec_helper'

describe Viewer do
  it { should belong_to(:user) }
  it { should belong_to(:ad) }
end
