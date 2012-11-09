require "gitcss/version"
require "gitcss/selector"
require "gitcss/git_object"
require "gitcss/commit"
require "gitcss/tree"
require "gitcss/blob"
require "gitcss/reference"
require "rugged"
require "nokogiri"

class GitCSS
  TYPES = {
    "commit" => Commit,
    "tag"    => Reference,
    "branch" => Reference,
    "ref"    => Reference,
    "blob"   => Blob,
    "tree"   => Tree,
  }

  def initialize(path)
    @rugged_repo = Rugged::Repository.new(path)
  end

  def get(selector)
    GitCSS::Selector.parse(selector).inject(nil) do |last_result, part|
      TYPES[part.type].find(@rugged_repo, part, last_result)
    end
  end

end
