require 'rails_helper'

RSpec.describe SearchAnalytic, type: :model do
  it 'is valid with valid attributes' do
    analytic = SearchAnalytic.new(ip: '192.168.1.1', query: 'How to plant carrots', recorded_at: Time.now)
    expect(analytic).to be_valid
  end

  it 'is not valid without an IP' do
    analytic = SearchAnalytic.new(query: 'How to plant carrots', recorded_at: Time.now)
    expect(analytic).not_to be_valid
  end

  it 'is not valid without a query' do
    analytic = SearchAnalytic.new(ip: '192.168.1.1', recorded_at: Time.now)
    expect(analytic).not_to be_valid
  end

  it 'is not valid without a recorded_at timestamp' do
    analytic = SearchAnalytic.new(ip: '192.168.1.1', query: 'How to plant carrots')
    expect(analytic).not_to be_valid
  end
end
