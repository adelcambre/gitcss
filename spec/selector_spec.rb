require 'spec_helper'

describe GitCSS::Selector do
  it "commit" do
    selector = GitCSS::Selector.parse("commit")
    selector.size.should == 1
    part = selector.first
    part.type.should == "commit"
    part.attrs.should == {}
  end

  it "commit#sha" do
    selector = GitCSS::Selector.parse("commit#sha")
    selector.size.should == 1
    part = selector.first
    part.type.should == "commit"
    part.attrs.should == {"id" => "sha"}
  end

  it "commit#sha[author=Test]" do
    selector = GitCSS::Selector.parse("commit#sha[author=Test]")
    selector.size.should == 1
    part = selector.first
    part.type.should == "commit"
    part.attrs.should == {"id" => "sha", "author" => "Test"}
  end

  it "commit#sha[author=Test][foo=bar] tree[path='foo/bar']" do
    selector = GitCSS::Selector.parse('commit#sha[author=Test][foo=bar] tree[path="foo/bar"]')
    selector.size.should == 2
    commit = selector.first
    commit.type.should == "commit"
    commit.attrs.should == {"id" => "sha", "author" => "Test", "foo" => "bar"}

    tree = selector.last
    tree.type.should == "tree"
    tree.attrs.should == {"path" => "foo/bar"}

  end
end
