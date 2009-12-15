require File.join(File.dirname(__FILE__), ".." ,"spec_helper" )

module Pairing
  describe Match do
    context "starting up" do
      before(:each) do
        @messenger = mock("messenger").as_null_object
        @match = Match.new(@messenger)
      end
      it "should receive a cas" do
        @messenger.should_receive(:puts).with("2002, 38, 13")
        @match.cas([2002, 38, 13])
      end
      it "should receive a temoin" do
        @match.temoin([2002, 38, 13])
      end
    end

    context "finding a match" do
      context "with 3 same columns" do
        it "should return 3 matches" do
          messenger = mock("messenger").as_null_object
          match = Match.new(messenger)
          match.cas([2002, 38, 13])
          match.temoin([2002, 38, 13])

          messenger.should_receive(:puts).with("3 match(es)")

          match.find
        end
      end
      context "with 2 similar columns" do
        it "should return 2 matches" do
          messenger = mock("messenger").as_null_object
          match = Match.new(messenger)
          match.cas([2002, 38, 13])
          match.temoin([2002, 38, 10])

          messenger.should_receive(:puts).with("2 match(es)")

          match.find
        end
      end
      context "with 1 similar columns" do
        it "should return 1 matches" do
          messenger = mock("messenger").as_null_object
          match = Match.new(messenger)
          match.cas([2002, 38, 13])
          match.temoin([2002, 35, 10])

          messenger.should_receive(:puts).with("1 match(es)")

          match.find
        end
      end
      context "with 0 same columns" do
        it "should return no match" do
          messenger = mock("messenger").as_null_object
          match = Match.new(messenger)
          match.cas([2002, 38, 13])
          match.temoin([2000, 35, 10])

          messenger.should_receive(:puts).with("No match.")

          match.find
        end
      end
    end
  end
end
