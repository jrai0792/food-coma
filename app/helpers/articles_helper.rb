module ArticlesHelper
  def image(article)
    # image_tag article.image
    if !article.image.file.nil?
      image_tag article.image
    else
      image_tag 'default.jpeg'
    end
  end
end
