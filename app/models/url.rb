require 'uri'

class Url < ActiveRecord::Base

	validates_uniqueness_of :custom_url, :allow_blank => true
  validates_uniqueness_of :original_url
	validates :original_url, 
							:presence => true, 
							:format => {
								:with => URI::regexp(%w(http https)),
								:message => "Your URL is not valid, only HTTP and HTTPS links allowed."
							}

	HOST_NAME = "http://localhost:3000"

	RANDOM_GENERATOR = [*'1'..'9', *'a'..'z', *'A'..'Z']
	.shuffle.join
	BASE = RANDOM_GENERATOR.length

  def create_short_url
    number = self.id - 1
    return RANDOM_GENERATOR[0] if number == 0

    str = ""

    while number > 0
      str << RANDOM_GENERATOR[(number % BASE)]
      number /= BASE
    end
    str.reverse
  end

  def show_custom_url
    path = "/urls/" + self.custom_url
    link = HOST_NAME + path
  end

end
