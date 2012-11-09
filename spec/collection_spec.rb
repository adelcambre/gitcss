require 'spec_helper'

describe "fetching a colletion of objects" do
  let(:gitcss) { GitCSS.new(File.expand_path("../fixture/.git", __FILE__)) }

  it "gets all commits" do
    commits = gitcss.get("commit")
    commits.size.should == 6
    commits.map(&:oid).should == [
      "0822a01fcff3e56f213a09ab47961d041ac9cfec",
      "77b879b1dc2f7508fbc3e53c54c2be6de3bec2e8",
      "d66706eedb179ee3c637c11a8dce250341000167",
      "c16b334edd580027fced58df89995bcc89f279e1",
      "c88b4c93a32482197fdcfba0b6aa22978e721c29",
      "29425ea4a0a857748cd90823f51065fe0257381a"
    ]
  end

  it "gets commits by author email" do
    commits = gitcss.get("commit[email='test@example.com']")
    commits.size.should == 1
    commits.first.author[:email].should == "test@example.com"
  end
end
