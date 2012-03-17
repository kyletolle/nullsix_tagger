class Link < ActiveRecord::Base
  validates :url, :presence => true
  before_save :tag_url

  def tag_url
    self.url = tagged_url
  end
  
  private
    def tagged_url
      # Don't tag a tagged link again
      return self.url if url_is_already_tagged
      
      tag_starter = url_contains_a_param_string? ? "&" : "?"
      self.url + tag_starter + "tag=nu07-20"
    end

    def url_is_already_tagged
      self.url =~ /tag=nu07-20/
    end

    def url_contains_a_param_string?
      self.url =~ /\?/ ? true : false
    end

end
