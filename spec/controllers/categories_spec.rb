require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  setup do
    @category = Category.create(name: 'Sports')
  end

  it 'should get index' do
    get :index
    expect(response).to have_http_status(:success)
  end

  it 'should get new' do
    get :new
    expect(response).to have_http_status(:success)
  end

  it 'should show category' do
    get :show, params:{ id: @category.id }
    expect(response).to have_http_status(:ok)
  end

end
