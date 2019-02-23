module PostHelper
  def thumbnail_youtube(post)
    if post.url.match(/https:\/\/www.youtube.com\/watch\?v=(.+)/)
      new_url = post.url.gsub('https://www.youtube.com/watch?v=', 'https://www.youtube.com/embed/')
      iframe(new_url)
    elsif post.url.match(/https:\/\/youtu.be\/(.+)/)
      new_url = post.url.gsub('https://youtu.be/', 'https://www.youtube.com/embed/')
      iframe(new_url)
    end
  end

  def iframe(new_url)
    iframe = content_tag(
      :iframe,
      '',
      src: new_url.to_s,
      frameborder: 0,
      allowfullscreen: true
    )
    content_tag(:div, iframe, class: 'embed-responsive embed-responsive-16by9')
  end
end
