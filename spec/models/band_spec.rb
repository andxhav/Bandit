require 'rails_helper'

RSpec.describe Band, type: :model do
  it { should  have_valid(:band_name).when("PUP")}
  it { should_not have_valid(:band_name).when('', nil) }
  it { should  have_valid(:scene).when("Toronto")}
  it { should_not have_valid(:scene).when('', nil) }
  it { should have_valid(:genre).when("post-punk")}
  it { should have_valid(:genre).when('', nil) }
end
