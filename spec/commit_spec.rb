require 'spec_helper'

describe "commit#sha" do
  let(:gitcss) { GitCSS.new(File.expand_path("../fixture/.git", __FILE__)) }

  it "gets a commit object" do
    commit = gitcss.get("commit#29425ea4a0a857748cd90823f51065fe0257381a")
    commit.oid.should == "29425ea4a0a857748cd90823f51065fe0257381a"
  end
end
