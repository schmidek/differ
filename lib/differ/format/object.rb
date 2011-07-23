module Differ
  module Format
    module Object
      class << self
        def format(change)
          (change.change? && as_change(change)) ||
          (change.delete? && as_delete(change)) ||
          (change.insert? && as_insert(change)) ||
          ''
        end
        def parse(object)
			
        end

      private
        def as_insert(change)
          "{+#{change.insert.inspect}}"
        end

        def as_delete(change)
          "{-#{change.delete.inspect}}"
        end

        def as_change(change)
          "{#{change.delete.inspect} >> #{change.insert.inspect}}"
        end
      end
    end
  end
end
