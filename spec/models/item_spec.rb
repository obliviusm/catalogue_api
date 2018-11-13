require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { create(:item, name: 'Book') }

  it { should belong_to(:category) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { expect(subject.friendly_id).to eq 'book' }

  it { should allow_value(11.12).for(:price) }
  it { should_not allow_value('hi').for(:price) }
  it { should_not allow_value(nil).for(:price) }
  it { should_not allow_value(-5).for(:price) }
end
