require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { create(:category, name: "Here is the name") }

  it { should have_many(:items) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it{ expect(subject.friendly_id).to eq 'here-is-the-name' }
end
