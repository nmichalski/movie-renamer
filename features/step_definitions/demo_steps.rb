When /^I choose the movie directory "(.*)"$/ do |dir|
  Dir.chdir(dir)
  Dir.getwd[-dir.length, dir.length].should == dir
end

Then /^there should be a listing for "(.*)"$/ do |movie|
  Dir.entries(".").should include movie
end

