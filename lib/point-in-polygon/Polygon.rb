require "matrix"
class Polygon

  def initialize(p)
    @sides = p.length
    @vertices = sort(p)
  end

  def isConvex
    vectors = []
    for i in 1..@sides
      vectors << @vertices[i % @sides] - @vertices[i-1]
    end
    cross_product = each_cross_product(vectors)
    return isSameDir(cross_product) ? true : false
  end

  def isInside(target)
    if isConvex
      target_vector = target_vector(target)
      cross_product = each_cross_product(target_vector)
      return isSameDir(cross_product) ? 1 : 0
    end

    return -1
  end

  protected
  def sort(p)

    x = y = 0
    for v in p
      x += v[0]
      y += v[1]
    end
    avg_dot = [x/@sides, y/@sides]

    arctan = []
    for v in p
      arctan << Math.atan2(v[0] - avg_dot[0], v[1] - avg_dot[1])
    end
    ind = arctan.map{|e| arctan.sort.index(e)}
    p = p.sort_by{|x| ind[p.index(x)]}
    return p
  end

  def target_vector(target)
    target_vector = []
    for v in @vertices
      target_vector << v - target
    end
    return target_vector
  end

  def each_cross_product(vectors)

    cross_product = []
    len = vectors.length

    for i in 1..len
      cross_product << vectors[i-1].cross_product(vectors[i % @sides])
    end

    return cross_product
  end

  def isSameDir(cross_product)
    len = cross_product.length
    for i in 1..len
      if cross_product[i-1][2] * cross_product[i % len][2] < 0
        return false
      end
    end
    return true
  end

end