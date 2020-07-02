require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

# Test suite for User model
RSpec.describe User, type: :model do
  # Association test
  # ensure User model has a 1:m relationship with the Quest model
  it { should have_many(:created_quests) }
  it { should have_many(:accepted_quests) }
  # Validation tests
  # ensure attributes are present before save
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:phone_number) }
end