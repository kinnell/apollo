class UserNotifier < ActionMailer::Base

  def new_project_email(user, project)
  	@project = project
  	@user = user
	  mail(from: "#{@project.creator.name} <#{@project.creator.email}>", to: "#{@user.name} <#{@user.email}>", subject: "[eCW apollo] You have been assigned to [#{@project.product_name}] #{@project.name}")
  end

end
