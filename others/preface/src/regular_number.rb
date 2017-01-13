#one queue solution
def get_number(n)
  q = [1]
  while n>0 do
    x = q.shift
    q = bin_unique_enqueue(q, 2*x)
    q = bin_unique_enqueue(q, 3*x)
    q = bin_unique_enqueue(q, 5*x)
    #q = unique_enqueue(q, 2*x)
    #q = unique_enqueue(q, 3*x)
    #q = unique_enqueue(q, 5*x)
    n -= 1
  end
  return x
end
#trivial unique enqueue
def unique_enqueue(q, x)
  l = 0
  u = q.size - 1
  while l <= u
    if q[l] < x
      l += 1
    elsif q[l] > x
      break
    else
      return q
    end
  end
  q.insert(l, x)
end
#binary search to enqueue
def bin_unique_enqueue(q, x)
  l = 0
  u = q.size-1
  while l <= u
    mid = (u+l) >> 1
    if q[mid] < x
      l = mid + 1
    elsif q[mid] > x
      u = mid - 1
    else
      return q
    end
  end
  q.insert(l, x)
end

#three queue solution
def get_number2(n)
  return 1 if n == 1
  q1 = [2]
  q2 = [3]
  q3 = [5]
  while n>1 do
    x = [q1.first, q2.first, q3.first].min
    if x == q1.first
      q1.shift
      q1 << 2*x
      q2 << 3*x
      q3 << 5*x
    elsif x ==  q2.first
      q2.shift
      q2 << 3*x
      q3 << 5*x
    else
      q3.shift
      q3 << 5*x
    end
    n -= 1
  end
  return x
end

#
# get_number with unique_enqueue:     0.020797470000000012
# get_number with bin_unique_enqueue: 0.0024227199999999997
# get_numerb2:                        0.0007246699999999995
#
def test
  tm = 0
  ret = 0
  100.times do
    start = Time.now
    #ret = get_number(1500)
    ret = get_number2(1500)
    stop = Time.now
    tm += (stop-start)
  end
  puts "average: #{tm/100} s. ret = #{ret}"
end

test()
