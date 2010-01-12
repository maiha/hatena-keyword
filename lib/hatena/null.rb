module Hatena
  class Null
    def method_missing(*)
      self
    end
  end
end
