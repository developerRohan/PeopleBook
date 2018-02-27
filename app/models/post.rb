class Post < ApplicationRecord
	include PublicActivity::Model
	belongs_to :user
	validates_presence_of :content
	validates_presence_of :user_id

	auto_html_for :content do
		html_escape
		image
		youtube(width: '100%',height: 250,autoplay: false)
		link target: "_blank" , rel: 'nofollow'
		simple_format
	end
end
