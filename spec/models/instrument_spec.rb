require 'rails_helper'

RSpec.describe Instrument, type: :model do
  it { should  have_valid(:instrument).when("electric guitar")}
  it { should_not have_valid(:instrument).when('', nil) }
  it { should  have_valid(:years_experience).when(6)}
  it { should_not have_valid(:years_experience).when('', nil) }
end
