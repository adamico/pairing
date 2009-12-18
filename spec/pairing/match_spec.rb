require File.join(File.dirname(__FILE__), ".." ,"spec_helper" )

module Pairing
  describe Match do
    before(:each) do
      @messenger = mock("messenger").as_null_object
      @match = Match.new(@messenger)
      @cas = [2002, 38, 13]
    end

    context "finding a match" do
      context "with 3 same columns" do
        before(:each) do
          @temoin = [2002, 38, 13]
          @match.cas(@cas)
          @match.temoin(@temoin)
        end
        it "should return 3 matches" do
          @messenger.should_receive(:puts).with("3 match(es)")
          @match.find
        end
      end
      context "with 2 similar columns" do
        before(:each) do
          @temoin = [2002, 38, 10]
          @match.cas(@cas)
          @match.temoin(@temoin)
        end
        it "should return 2 matches" do
          @messenger.should_receive(:puts).with("2 match(es)")
          @match.find
        end
      end
      context "with 1 similar columns" do
        before(:each) do
          @temoin = [2002, 35, 10]
          @match.cas(@cas)
          @match.temoin(@temoin)
        end
        it "should return 1 matches" do
          @messenger.should_receive(:puts).with("1 match(es)")

          @match.find
        end
      end
      context "with 0 same columns" do
        before(:each) do
          @temoin = [2000, 35, 10]
          @match.cas(@cas)
          @match.temoin(@temoin)
        end
        it "should return no match" do
          @messenger.should_receive(:puts).with("No match(es)")
          @match.find
        end
      end
    end
  end
end
