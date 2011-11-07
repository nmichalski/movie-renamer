require 'movie_searcher'

class MovieRenamer

WORKING_DIRECTORY = Dir.pwd

  attr_accessor :current_directory, :current_movie_info, :search_results, :error_message

  def initialize
    @current_movie_info = {}
    @current_directory = WORKING_DIRECTORY.dup
    Dir.chdir(WORKING_DIRECTORY)
  end
  
  def change_dir_to(dir)
    Dir.chdir(dir)
    @current_directory = Dir.pwd
  end

  def dir_entries
    valid_entries = Dir.entries(".")
    valid_entries.delete(".")
    valid_entries.delete("..")
    valid_entries
  end

  def check_for_empty_dir
    if dir_entries.empty?
      @error_message = "Movie directory was empty"
    end
  end

  def find_movie_info
    @search_results = MovieSearcher.find_by_release_name(@current_movie_info["name"])
  end

  def new_file_format
    find_movie_info
    "#{@search_results.title} [#{@search_results.release_date[0..3]}].#{@current_movie_info["file_extension"]}"
  end

  def set_current_movie(name)
    @current_movie_info["name"] = name
    @current_movie_info["file_extension"] = name.split(".")[-1]
  end

end
