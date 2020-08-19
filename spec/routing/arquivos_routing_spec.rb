require 'rails_helper'

RSpec.describe ArquivosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/arquivos').to route_to('arquivos#index')
    end

    it 'routes to #new' do
      expect(get: '/arquivos/new').to route_to('arquivos#new')
    end

    it 'routes to #show' do
      expect(get: '/arquivos/1').to route_to('arquivos#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/arquivos/1/edit').to route_to('arquivos#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/arquivos').to route_to('arquivos#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/arquivos/1').to route_to('arquivos#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/arquivos/1').to route_to('arquivos#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/arquivos/1').to route_to('arquivos#destroy', id: '1')
    end
  end
end
