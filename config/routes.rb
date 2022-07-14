Rails.application.routes.draw do

#ルーティングページの設定
root to: 'homes#top'

resources :parkings, only: [:new, :index, :show ]

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
