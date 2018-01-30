module ApplicationHelper
  # Get the preview URL for a content model
  def preview_url_for(content)
    type = case content
           when Gallery
             'gallery'
           when Quiz
             'quiz'
           when Timeline
             'timeline'
           when VideoGallery
             'videos'
           else
             raise "Can't generate preview URL for #{content.class}"
           end

    url = "#{url_for(content)}.json"

    Addressable::Template.new("/preview.html{?query*}")
      .expand({
        "query" => { type: type, url: url }
      })
      .to_s
  end
end
