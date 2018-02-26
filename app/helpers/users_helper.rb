module UsersHelper
	def action_button(user)
		if current_user
			case current_user.friendship_status(user) 
			when "active"
				 link_to "end frienship" ,friendship_path(current_user.find_friendship(user)) , method: :delete
			when "pending"
				 link_to "cancel request" ,friendship_path(current_user.find_friendship(user)) , method: :delete
			when "requested"
				 link_to "accept frienship" ,accept_friendship_path(current_user.find_friendship(user)) , method: :put
			when "not_friends"
				 link_to "add as a friend" ,friendships_path(user_id: user.id) , method: :post
			end
		end
	end
end
