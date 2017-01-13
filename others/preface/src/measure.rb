require './minfree.rb'

def measure(lst, block, x)
  start = Time.now
  assert(block.call(lst), x)
  stop = Time.now

  return stop - start
end

def test_min_free(&block)
  lst = (0..100000).to_a
  tm = 0
  100.times do |i|
    lst.shuffle!
    x = lst.pop
    tm = tm + measure(lst, block, x)
    puts "#{tm} elapsed."
    lst << x
  end

  puts "average time #{tm/100}"
end

def test
  test_min_free do |x|
    min_free(x)
  end
  test_min_free do |x|
    dc_min_free(x)
  end
end
if __FILE__ == $0
  test()
end
