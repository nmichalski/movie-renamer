STARTING_DIRECTORY = Dir.pwd

When /^I choose the movie directory "(.*)"$/ do |dir|
  Dir.chdir(STARTING_DIRECTORY)
  Dir.chdir(dir)
  Dir.getwd[-dir.length, dir.length].should == dir
end

When /^I choose an empty directory like "(.*)"$/ do |dir|
  Dir.chdir(STARTING_DIRECTORY)
  Dir.chdir(dir)
  Dir.getwd[-dir.length, dir.length].should == dir
  Dir.entries(".").should == [".", ".."]
end

Then /^there should be a listing for "(.*)"$/ do |movie|
  Dir.entries(".").should include movie
end

Then /^there should be a message saying "(.*)"$/ do |msg|
  #TODO: make MovieRenamer class
  #MovieRenamer.error_message.should == msg
end
