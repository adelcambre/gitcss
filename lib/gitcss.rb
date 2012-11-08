require "gitcss/version"
require "gitcss/selector"
require "rugged"
require "nokogiri"

TYPES = {
  "commit" => Rugged::Commit,
  "tag"    => Rugged::Reference,
  "branch" => Rugged::Reference,
  "ref"    => Rugged::Reference,
  "blob"   => Rugged::Blob,
  "tree"   => Rugged::Tree,
}

class GitCSS
  def initialize(path)
    @rugged_repo = Rugged::Repository.new(path)
  end

  def get(selector)
    GitCSS::Selector.parse(selector).inject(@rugged_repo) do |last_result, part|
      get_part(part, last_result)
    end
  end

  def get_part(part, parent=nil)
    obj_by_id(part)
  end

  def obj_by_id(selector)
    obj = @rugged_repo.lookup(selector.id)
    if obj.is_a?(TYPES[selector.type])
      obj
    else
      nil
    end
  end

end
