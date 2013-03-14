class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_questions

  include ApplicationHelper
  include SessionHelper
end
