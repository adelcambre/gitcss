class GitCSS
  class Commit < GitObject
    def run
      if @selector.id
        ensure_type(Rugged::Commit, @rugged_repo.lookup(@selector.id))
      elsif @selector.attrs.empty?
        all
      else
        @selector.attrs.inject(all) do |commits, (k,v)|
          case k
          when "email"
            commits.select do |commit|
              commit.author[:email] == v
            end
          end
        end
      end
    end

    def all
      heads = [@rugged_repo.last_commit]
      commits = []
      while(commit = next_commit(heads))
        unless commits.include?(commit)
          commits << commit
        end
      end
      commits
    end

    def next_commit(heads)
      heads.sort_by!(&:epoch_time)
      heads.delete_at(-1).tap do |commit|
        (heads << commit.parents).flatten! if commit
      end
    end
  end
end
