Archangel::Engine.routes.draw do
  namespace :admin, path: Archangel.configuration.admin_path do
    # POST  /admin/profile/retoken
    post "profile/retoken", to: "profiles#retoken", as: "profile_retoken"

    # POST  /admin/users/[USERNAME]/retoken
    post "users/:id/retoken", to: "users#retoken", as: "user_retoken"
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # GET /api/v1/profile
      resource :profile, only: [:show]

      # GET /api/v1/site
      resource :site, only: [:show]

      # GET /api/v1/categories
      # GET /api/v1/categories/[SLUG]
      resources :categories, only: [:index, :show]

      # GET /api/v1/pages
      # GET /api/v1/pages/[ID]
      resources :pages, only: [:index, :show]

      # GET /api/v1/tags
      # GET /api/v1/tags/[SLUG]
      resources :tags, only: [:index, :show]

      # GET /api/v1/users
      # GET /api/v1/users/[USERNAME]
      resources :users, only: [:index, :show]
    end

    # GET /api/v*/[PATH] -> /api/v1/[PATH]
    match "v:api/*path", to: redirect("/api/v1/%{path}"),
                         via: [:get, :post, :put, :patch, :delete]

    # GET /api/[PATH] -> /api/v1/[PATH]
    match '*path', to: redirect{ |params, request|
      "/api/v1/%{path}?#{request.query_string}"
    }, via: [:get, :post, :put, :patch, :delete]
  end
end
