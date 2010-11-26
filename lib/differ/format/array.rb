module Differ
  module Format
    module Array
      class << self
        def format(change)
          (change.change? && as_change(change)) ||
          (change.delete? && as_delete(change)) ||
          (change.insert? && as_insert(change)) ||
          ''
        end
        def parse(array)
			options = {}
			unless array[0].nil?
				options[:delete] = array[0]
			end
			unless array[1].nil?
				options[:insert] = array[1]
			end 
			return Change.new(options)
        end
        def type
			[]
        end

      private
        def as_insert(change)
          [nil,change.insert]
        end

        def as_delete(change)
          [change.delete,nil]
        end

        def as_change(change)
          [change.delete,change.insert]
        end
      end
    end
  end
end
