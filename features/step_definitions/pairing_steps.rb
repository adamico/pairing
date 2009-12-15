Given(/^a cas with values (.+)$/) do |values|
  @cas = Pairing::Cas.new(values)
  #values.split(', ').each do |value|
    #@cas << value
  #end
end

When(/^I try to match a temoin with values (.+)$/) do |values|
  @temoin = Pairing::Temoin.new(values)
  #values.split(', ').each do |value|
    #value = value.to_i
    #@temoin << value
  #end
end

Then(/^I should have (\d+) matches$/) do |match|
  result = Pairing::Match(@cas, @temoin)
  result.should == match.to_i
  #@cas.each_with_index do |value, index|
    #value = value.to_i
    #@count ||= 0
    #if index == 0
      ## the first cas_value must be = temoin_value +/- 1
      #if @temoin[index].between?(value - 1, value + 1)
        #@count += 1
      #end
    #else
      ## the second and third cas_value must be = temoin_value +/- 2
      #if @temoin[index].between?(value - 2, value + 2)
        #@count += 1
      #end
    #end
  #end
  #@count.should == match.to_i
end
