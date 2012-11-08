require "gitcss/version"
require "gitcss/selector"
require "rugged"
require "nokogiri"

TYPES = {
  "commit" => Rugged::Commit,
  "tree" => Rugged::Tree
}

class GitCSS
  def initialize(path)
    @rugged_repo = Rugged::Repository.new(path)
  end

  def get(selector)
    obj_by_id(GitCSS::Selector.new(selector).parts.first)
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
