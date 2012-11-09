class GitCSS
  class Blob < GitObject
    def run
      if @selector.id
        ensure_type(Rugged::Blob, @rugged_repo.lookup(@selector.id))
      end
    end
  end
end

