When /^I choose the movie directory "(.*)"$/ do |dir|
  @movie_renamer = MovieRenamer.new
  @movie_renamer.change_dir_to(dir)
  @movie_renamer.current_directory[-dir.length, dir.length].should == dir
end

Then /^there should be a listing for "(.*)"$/ do |movie|
  @movie_renamer.dir_entries.should include movie
end

And /^the directory is empty$/ do
  @movie_renamer.dir_entries.should == []
end

Then /^there should be a message saying "(.*)"$/ do |msg|
  @movie_renamer.check_for_empty_dir
  @movie_renamer.error_message.should == msg
end

When /^I want to get IMDB info for the file "(.*)"$/ do |movie|
  @movie_renamer = MovieRenamer.new
  @movie_renamer.set_current_movie(movie)
end

Then /^I should get a cleaned up movie file name of "(.*)"$/ do |name|
  @movie_renamer.new_file_format.should == name
end

