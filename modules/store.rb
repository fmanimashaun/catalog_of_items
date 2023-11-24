require 'json'
require 'fileutils'

module Store
  def save_items
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/items.json', JSON.dump(@items.map(&:to_json)))
  end

  # @genres = []
  # @labels = []
  # @authors = []
  # @sources = []

  def save_genres
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/genres.json', JSON.dump(@genres.map(&:to_json)))
  end

  def save_labels
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/labels.json', JSON.dump(@labels.map(&:to_json)))
  end

  def save_authors
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/authors.json', JSON.dump(@authors.map(&:to_json)))
  end

  def save_sources
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/sources.json', JSON.dump(@sources.map(&:to_json)))
  end

  def load_rentals
    return unless File.exist?('data/rentals.json')

    JSON.parse(File.read('data/rentals.json')).map do |rental|
      rental_obj = JSON.parse(rental)
      book = @books.find { |b| b.id == rental_obj['book'] }
      person = @people.find { |p| p.id == rental_obj['person'] }
      @rentals << Rental.new(rental_obj['date'], book, person)
    end
  end
end
