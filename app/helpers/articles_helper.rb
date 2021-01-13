module ArticlesHelper
  def image(article)
    if !article.image.file.nil?
      image_tag article.image
    else
      image_tag 'default.jpeg'
    end
  end
end
