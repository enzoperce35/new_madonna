module ApplicationHelper
  def user_is_principal
    current_user.username == 'paks'
  end

  def user_is_admin
    current_user.username == 'jenny'
  end

  def user_is_dev
    current_user.username == 'inso'
  end

  def user_is_non_admin
    current_user.branch.nil?
  end
  
  def branch_name
    if !user_signed_in? || user_is_non_admin
      ''
    else
      current_user.branch.prepend(' - ')
    end
  end
end
