Rails.application.routes.draw do
  post 'reserve', to: 'reservation#reserve'
end
