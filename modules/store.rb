require 'json'
require 'fileutils'

module Store
  def save_items
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/items.json', JSON.dump(@items.map(&:to_json)))
  end

  def load_items
    return unless File.exist?('data/items.json')

    JSON.parse(File.read('data/items.json')).map do |item|
      item_obj = JSON.parse(item, create_additions: true)
      @items << item_obj
    end
  end

  def save_genres
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/genres.json', JSON.dump(@genres.map(&:to_json))) unless @genres.empty?
  end

  def save_labels
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/labels.json', JSON.dump(@labels.map(&:to_json))) unless @labels.empty?
  end

  def save_authors
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/authors.json', JSON.dump(@authors.map(&:to_json))) unless @authors.empty?
  end

  def save_sources
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/sources.json', JSON.dump(@sources.map(&:to_json))) unless @sources.empty?
  end

  def load_genres
    return unless File.exist?('data/genres.json')

    # Convert @items to a Hash for faster lookup
    items_hash = {}
    @items.each { |item| items_hash[item.id] = item }

    JSON.parse(File.read('data/genres.json')).each do |genre|
      genre_obj = JSON.parse(genre)
      genre = Genre.new('name' => genre_obj['name'])

      genre_obj['items'].each do |id|
        item = items_hash[id]
        genre.add_item(item) unless item.nil?
      end

      @genres << genre
    end
  end
end
