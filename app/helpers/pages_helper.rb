module PagesHelper
  def check_user
    redirect_to root_path if !current_user || current_user.role != 'admin'
  end
end
