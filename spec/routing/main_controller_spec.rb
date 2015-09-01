require 'rails_helper'

RSpec.describe MainController, type: :routing do
  it 'routes to main#index' do
    expect(get: '/').to route_to('main#index')
  end
end
