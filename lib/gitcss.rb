require "gitcss/version"
require "rugged"
require "nokogiri"

class GitCSS
  def initialize(path)
    @rugged_repo = Rugged::Repository.new(path)
  end

  def get(selector)
    commit_for_id(Nokogiri::CSS.parse(selector).first.value.last.value.first[1..-1])
  end

  def commit_for_id(oid)
    @rugged_repo.lookup(oid)
  end

end
