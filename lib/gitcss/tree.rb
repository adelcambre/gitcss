class GitCSS
  class Tree < GitObject
    def run
      if @selector.id
        ensure_type(Rugged::Tree, @rugged_repo.lookup(@selector.id))
      end
    end
  end
end


