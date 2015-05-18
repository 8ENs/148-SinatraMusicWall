class Track < ActiveRecord::Base
  validates :song, :album, :artist, :fan, presence: true
  validate  :url_was_not_legit

  def url_was_not_legit
    # don't throw an error unless it's a valid url (regex) OR the url was empty
    unless /^(https?:\/\/[a-zA-Z|\d]{2,}\.[a-zA-Z|\d|\.]{2,})/.match(url) || url == ""
      errors.add(:url_was_not_legit, "--- your URL input was not legit! (please try again and include 'http://')")
    end
  end
end