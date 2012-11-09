class GitCSS
  class Reference < GitObject
    def run
      if @selector.id
        ensure_type(Rugged::Reference, @rugged_repo.lookup(@selector.id))
      end
    end
  end
end

