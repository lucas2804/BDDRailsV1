
module Metaprograming
  class  ExploreCollection
    attr_accessor words

    def initialize
      binding.pry
      self.words = %w{ Mary had a little lamb }
    end
    def index_for( word )
      self.words.find_index { |this_word|  word == this_word }
    end
  end
end