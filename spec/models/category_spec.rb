require 'rails_helper'

RSpec.describe Category, type: :model do

  it 'should be valid' do
    @category = Category.new(name: 'Sports')
    expect(@category.valid?).to be_truthy
  end

  it 'should have name present' do
    @category = Category.new(name: 'Sports')
    expect(@category.name?).to be_truthy
  end

  it 'should have length of name within required length' do
    @category = Category.new(name: 'Sports')
    expect(@category.name.length).to be_between(3, 15)
  end

end
