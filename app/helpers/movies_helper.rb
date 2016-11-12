module MoviesHelper
	def embed(youtube_url)
	    youtube_id = youtube_url.split("=").last
	    content_tag(:object, nil, data: "//www.youtube.com/embed/#{youtube_id}")
	end
end
