class AdminController < ApplicationController
  before_action :is_admin?
  def home
  end
end
