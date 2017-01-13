#min_free problem in ruby
def min_free(lst)
  n = lst.size
  a = [0] * (n+1)
  for x in lst
    if x < n
      a[x] = 1
    end
  end
  return a.index(0)
end

def brute_force(lst)
  i = 0
  while true
    if !lst.include?(i)
      return i
    end
    i = i + 1
  end
end

def dc_min_free(lst)
  return binary_search(lst, 0, lst.size - 1)
end

def binary_search(lst, l, u)
  if lst.empty?
    return l
  end

  m = (l+u) >> 1
  xs = lst.select{|x| x <= m}
  ys = lst.select{|x| x > m}

  if xs.size == m - l + 1
    return binary_search(ys, m+1, u)
  else
    return binary_search(xs,l,m)
  end
end

def assert(a, b)
  raise "Assertion failed! #{a} == #{b}" unless a == b
end

def test
  lst = [8, 23, 9, 0, 12, 11, 1, 10, 13, 7, 41, 4, 14, 21, 5, 17, 3, 19, 2, 6]
  assert(min_free(lst), brute_force(lst))
  assert(dc_min_free(lst), brute_force(lst))
  assert(min_free(1..5), brute_force(1..5))
end

if __FILE__ == $0
  test()
end
