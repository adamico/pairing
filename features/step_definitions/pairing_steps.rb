Given(/^a cas with values (.+)$/) do |values|
  @messenger = StringIO.new
  @match = Pairing::Match.new(@messenger)
  @cas = @match.cas(values.split(','))
end

When(/^I try to match a temoin with values (.+)$/) do |values|
  @temoin = @match.temoin(values.split(', '))
end

Then(/^I should have (\d+) matches$/) do |match|
  @messenger.string.should include(match)
end
