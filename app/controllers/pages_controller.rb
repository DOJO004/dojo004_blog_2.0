class PagesController < ApplicationController
  before_action :check_user, only: [:dashboard]
    def dashboard
      @articles = Article.all.order(created_at: :desc)
    end
end
