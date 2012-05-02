class SparseArray
  attr_reader :hash

  def initialize
    @hash = {}
  end

  def [](key)
    hash[key] ||= {}
  end


end

