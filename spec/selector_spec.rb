require 'spec_helper'

describe GitCSS::Selector do
  it "commit" do
    selector = GitCSS::Selector.new("commit")
    selector.parts.size.should == 1
    part = selector.parts.first
    part.type.should == "commit"
    part.attrs.should == {}
  end

  it "commit#sha" do
    selector = GitCSS::Selector.new("commit#sha")
    selector.parts.size.should == 1
    part = selector.parts.first
    part.type.should == "commit"
    part.attrs.should == {"id" => "sha"}
  end

  it "commit#sha[author=Test]" do
    selector = GitCSS::Selector.new("commit#sha[author=Test]")
    selector.parts.size.should == 1
    part = selector.parts.first
    part.type.should == "commit"
    part.attrs.should == {"id" => "sha", "author" => "Test"}
  end

  it "commit#sha[author=Test][foo=bar] tree[path='foo/bar']" do
    selector = GitCSS::Selector.new('commit#sha[author=Test][foo=bar] tree[path="foo/bar"]')
    selector.parts.size.should == 2
    commit = selector.parts.first
    commit.type.should == "commit"
    commit.attrs.should == {"id" => "sha", "author" => "Test", "foo" => "bar"}

    tree = selector.parts.last
    tree.type.should == "tree"
    tree.attrs.should == {"path" => "foo/bar"}

  end
end
