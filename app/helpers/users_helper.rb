module UsersHelper
	def action_button(user)
		case current_user.friendship_status(user) 
		when "active"
			 "remove frienship"
		when "pending"
			 "cancel request"
		when "requested"
			 "accept/deny friendship"
		when "not_friends"
			 "add as a friend"
		end
	end
end
