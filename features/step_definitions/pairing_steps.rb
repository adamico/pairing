Given(/^a cas with values (.+)$/) do |values|
  @messenger = StringIO.new
  @match = Pairing::Match.new(@messenger)
  @match.cas(values.split(', '))
end

When(/^I try to match a temoin with values (.+)$/) do |values|
  @match.temoin(values.split(', '))
end

Then(/^I should see "([^\"]*)"$/) do |match|
  @match.find
  @messenger.string.should include(match)
end
