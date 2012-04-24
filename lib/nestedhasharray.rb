class SparseArray
  attr_reader :hash

  def initialize
    @hash = {}
  end

  def [](key)
    hash[key] ||= {}
  end

  def rows
    hash.length   
  end

  alias_method :length, :rows
end

