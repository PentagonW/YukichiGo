class ApplicationController < ActionController::Base
  helper_method :current_user

  def browser_id
    @browser_id ||= cookies.permanent["noguchi_go"] || cookies["noguchi_go"] || generate_cookies
  end

  def current_user
    @current_user ||= User.find_by(browser_id: browser_id) || UserFactory.new(browser_id: browser_id).create
  end

  def set_browser_id(browser_id)
    @current_user = User.find_by(browser_id: browser_id)
    cookies.permanent["noguchi_go"] = @current_user.browser_id if @current_user
  end

  def persistence_cookie
    cookies.permanent["noguchi_go"] ||= cookies["noguchi_go"]
  end

  private

    def generate_cookies
      cookies.permanent["noguchi_go"] = SecureRandom.uuid
    end
end
