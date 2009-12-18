Given(/^a cas with (.+)$/) do |values|
  @messenger = StringIO.new
  @match ||= Pairing::Match.new(@messenger)
  values = values.split(', ').collect { |v| v.to_i }
  @match.cas(values)
end

Then(/^I should see "([^\"]*)"$/) do |message|
  @messenger.string.split("\n").should include(message)
end

When(/^a temoin with (.+)$/) do |values|
  values = values.split(', ').collect { |v| v.to_i }
  @match.temoin(values)
end

Then(/^the result should be "([^\"]*)"$/) do |result|
  @match.find
  @messenger.string.split("\n").should include(result)
end
