require 'rails_helper'

RSpec.describe Gig, type: :model do
  it { should  have_valid(:address).when("31 Oakland St, Brighton, MA")}
  it { should_not have_valid(:address).when('', nil) }
  it { should  have_valid(:gig_lat).when(6.00001)}
  it { should_not have_valid(:gig_lat).when('', nil) }
  it { should  have_valid(:gig_long).when(-6.00001)}
  it { should_not have_valid(:gig_long).when('', nil) }
  it { should  have_valid(:date).when("2019-01-09 20:30:00")}
  it { should_not have_valid(:date).when('', nil) }
end
