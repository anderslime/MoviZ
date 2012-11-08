class RoviMovieService < Struct.new(:id, :sig)
  class << self
    def movie_by_title(title, sig, with_related = false)
      service = new(url_friendly(title), sig)
      if service.movie_exists?
        RoviMovie.new(*service.fetch_all_and_related.values)
      else
        nil
      end
    end

    def movie_by_id(id, sig, with_related = false)
      service = new(id, sig)
      if service.movie_exists?
        RoviMovie.new(*service.fetch_all.values)
      else
        nil
      end
    end

    def url_friendly(string)
      string.sub(' ','+')
    end
  end

  def movie_exists?
    exists_url = RoviApi::Movies.info_url_by_title(title, sig)
    exists_hash = JsonApiParser.parse_from_url(exists_url)
    exists_hash['code'] == 200
  end

  def fetch_all_and_related
    [fetch_info, fetch_image, fetch_related].inject(:merge)
  end

  def fetch_all
    [fetch_info, fetch_image].inject(:merge)
  end

  def fetch_info
    info_url  = RoviApi::Movies.info_url_by_title(title, sig)
    info_hash = JsonApiParser.parse_from_url(info_url)
    {
      :id       => info_hash['movie']['ids']['movieId'],
      :title    => info_hash['movie']['title'],
      :released => info_hash['movie']['releaseYear'],
      :rating   => info_hash['movie']['rating']
    }
  end

  def fetch_image
    image_url  = RoviApi::Movies.image_url_by_title(title, sig)
    image_hash = JsonApiParser.parse_from_url(image_url)
    { :image_url => image_hash['images'][15]['url'] }
  end

  def fetch_related
    related_url  = RoviApi::Movies.similar_url_by_title(title, sig)
    related_hash = JsonApiParser.parse_from_url(related_url)
    related = []
    puts "fetching related!"
    related_hash['related']['similarTo'].each_with_index do |movie_hash, i|
      movie_id = movie_hash['ids']['movieId'].gsub(' ','+')
      break if i > 10
      related << RoviMovieService.movie_by_id(movie_id, sig)
    end
    { :related => related }
  end
end
