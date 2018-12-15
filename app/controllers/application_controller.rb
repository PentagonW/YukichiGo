class ApplicationController < ActionController::Base
  helper_method :current_user

  def browser_id
    @browser_id ||= cookies["noguchi_go"] || generate_cookies
  end

  def current_user
    @current_user ||= User.find_by(browser_id: browser_id) || UserFactory.new(browser_id: browser_id).create
  end

  private

    def generate_cookies
      cookies["noguchi_go"] = SecureRandom.uuid
    end
end
