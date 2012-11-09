require 'spec_helper'

describe "#sha" do
  let(:gitcss) { GitCSS.new(File.expand_path("../fixture/.git", __FILE__)) }

  it "gets a commit object" do
    commit = gitcss.get("commit#29425ea4a0a857748cd90823f51065fe0257381a")
    commit.oid.should == "29425ea4a0a857748cd90823f51065fe0257381a"
  end

  it "doesn't return non commit objects" do
    commit = gitcss.get("commit#1f2c5dc7dc5a0c2879e48293fe07e9b044986b19")
    commit.should be_nil
  end

  it "gets a tree object" do
    tree = gitcss.get("tree#1f2c5dc7dc5a0c2879e48293fe07e9b044986b19")
    tree.oid.should == "1f2c5dc7dc5a0c2879e48293fe07e9b044986b19"
  end

  it "gets a blob object" do
    blob = gitcss.get("blob#345e6aef713208c8d50cdea23b85e6ad831f0449")
    blob.oid.should == "345e6aef713208c8d50cdea23b85e6ad831f0449"
    blob.content.should == "Test\n"
  end
end
