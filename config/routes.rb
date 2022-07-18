Rails.application.routes.draw do

namespace :admin do
  resources :user, only: [:index, :show, :destroy]
  resources :parking, only: [:index, :show, :destroy]
  get '/top' => 'homes#top'
end
  
namespace :public do
  #parkings, only: [:new, :create, :index, :show, :destory] onlyを指定するとdestroyが認識されない*要解決
  resources :parkings do
    resources :post_comments, only: [:create, :destroy] #コメントは投稿に紐づくのでネストさせる
  end
  resources :users, only: [:show, :edit, :update]
  #退会確認画面用のルーティング
  get '/users/:user_id/unsubscribe' => 'users#confirm', as: 'unsubscribe'
  #論理削除用のルーティング
  patch '/users/:user_id/withdrawal' => 'users#delete_user', as: 'withdrawal'
end

#ルーティングページの設定
root to: 'homes#top'

get "/homes/about" => "homes#about", as: "about"

#ユーザー側のdeviseルーティング
#skipでユーザー側の新規登録とパスワード変更のルーティングを削除
devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

#管理者側のdeviseルーティング
#skipで管理者側の新規登録とパスワード変更のルーティングを削除
devise_for :admin, skip: [:registratins, :passwords], controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
