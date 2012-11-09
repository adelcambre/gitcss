class GitCSS
  class GitObject
    def initialize(rugged_repo, selector, parent=nil)
      @rugged_repo = rugged_repo
      @selector = selector
      @parent   = parent
    end

    def self.find(rugged_repo, selector, parent=nil)
      new(rugged_repo, selector, parent).run
    end

  private

    def ensure_type(type, obj)
      if obj.is_a?(type)
        obj
      else
        nil
      end
    end
  end
end

