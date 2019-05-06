require 'rails_helper'

RSpec.describe Musician, type: :model do
  it { should  have_valid(:first_name).when("Claudio")}
  it { should_not have_valid(:first_name).when('', nil) }
  it { should  have_valid(:last_name).when("Sanchez")}
  it { should_not have_valid(:last_name).when('', nil) }
  it { should  have_valid(:scene).when("NYC")}
  it { should_not have_valid(:scene).when('', nil) }
  it { should  have_valid(:email).when("coheed@cambria.com")}
  it { should_not have_valid(:email).when('', nil) }
  it { should have_valid(:home_town).when("PVD")}
  it { should have_valid(:home_town).when('', nil) }
end
