# frozen_string_literal: true

Rails.application.routes.draw do
  constraints(SubdomainAdmin) do
    get '/' => 'admin#index'
  end
end
