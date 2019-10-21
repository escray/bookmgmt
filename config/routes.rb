Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'journals#index'
  root 'static_pages#show', page: 'home'
  get '/faq' => 'pages#faq'
  get '/journals/:journal_id/docs/:doc_id/items/:id' => 'journal_docs#lend', as: :lend_doc_item

  namespace :admin do
    root 'application#index'

    resources :journals, only: %i[index new edit update create destroy] do
      resources :docs, only: %i[new edit update create destroy],
                       controller: 'journal_docs' do
        resources :tags, only: [] do
          member do
            delete :remove
          end
        end
      end

      member do
        post :reorder
      end
    end

    resources :books
    resources :orders do
      member do
        post :cancel
        post :prepare
        post :lend
        post :return
      end
    end

    resources :magazines

    resources :csv_imports
    resources :csv_exports

    resources :docs, only: %i[index new edit update create destroy] do
      collection do
        post :bulk_update
        post :import
      end
    end

    resources :versions do
      post :undo
    end

    resources :users do
      member do
        patch :archive
      end
    end

    resources :states, only: %i[index new create] do
      member do
        get :make_default
      end
    end

    resources :departments
  end
  # --- end of admin routes

  resources :journals, only: %i[index show] do
    resources :docs, controller: 'journal_docs' do
      resources :comments, only: [:create]

      resources :tags, only: [] do
        member do
          delete :remove
        end
      end
    end
  end

  resources :docs, only: %i[index show] do
    resources :comments, only: [:create]
    resources :tags, only: [] do
      member do
        delete :remove
      end
    end
  end

  # resources :books, only: %i[index show]
  resources :books do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :orders

  resources :cart_items

  resources :magazines, only: %i[index show]

  resources :attachments, only: %i[show new]

  namespace :account do
    resources :orders
  end
end
