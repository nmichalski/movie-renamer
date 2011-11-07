class MovieRenamer

WORKING_DIRECTORY = Dir.pwd

  attr_accessor :starting_directory, :current_directory, :error_message

  def initialize
    @error_message = ""
    @starting_directory = WORKING_DIRECTORY.dup
    @current_directory = WORKING_DIRECTORY.dup
    Dir.chdir(WORKING_DIRECTORY)
  end
  
  def navigate_to(dir)
    Dir.chdir(dir)
    @current_directory = Dir.pwd
  end

  def entries
    Dir.entries(".")
  end

  def check_for_empty_dir
    if entries == [".", ".."]
      @error_message = "Movie directory was empty"
    end
  end

end
