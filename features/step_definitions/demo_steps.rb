When /^I choose the movie directory "(.*)"$/ do |dir|
  @movie_renamer = MovieRenamer.new
  @movie_renamer.navigate_to(dir)
  @movie_renamer.current_directory[-dir.length, dir.length].should == dir
end

Then /^there should be a listing for "(.*)"$/ do |movie|
  @movie_renamer.entries.should include movie
end

When /^I choose an empty directory like "(.*)"$/ do |dir|
  @movie_renamer = MovieRenamer.new
  @movie_renamer.navigate_to(dir)
  @movie_renamer.current_directory[-dir.length, dir.length].should == dir
  @movie_renamer.entries.should == [".", ".."]
end

Then /^there should be a message saying "(.*)"$/ do |msg|
  @movie_renamer.check_for_empty_dir
  @movie_renamer.error_message.should == msg
end
