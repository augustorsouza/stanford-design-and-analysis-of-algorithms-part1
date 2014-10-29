# Program to count the number of inversions
# in the given list ("IntegerArray.txt") in O(n*log(n)).


# merge-and-count(A,B)
#   ;  A,B two input lists (sorted)
#   ;  C  output list
#   ;  i,j current pointers to each list, start at beginning
#   ;  a_i, b_j elements pointed by i, j
#   ;  count number of inversion, initially 0
# 
#   while A,B != empty
#     append min(a_i,b_j) to C
#     if b_j < a_i 
#        count += number of element remaining in A
#        j++
#     else
#        i++
# ; now one list is empty
# append the remainder of the list to C
# return count, C

def merge_and_count(a, b)
  count, i, j, c = 0, 0, 0, []
  while i < a.count && j < b.count do
    if b[j] < a[i]
      c << b[j]
      count += (a.count - i)
      j += 1
    else
      c << a[i]
      i += 1
    end
  end
  
  if i == a.count
    c.concat(b[j..b.count])
  else 
    c.concat(a[i..a.count])
  end
  
  return count, c
end

# sort-and-count(L)
#   if L has one element return 0
#   else
#      divide L into A, B 
#      (rA, A) = sort-and-count(A)
#      (rB, B) = sort-and-count(B)
#      (r, L) = merge-and-count(A,B)
#   return r = rA+rB+r, L

def sort_and_count(l)
  if l.count == 1
    return 0, l
  else
    a = l[0...l.count/2]
    b = l[l.count/2..l.count]

    r_a, a = sort_and_count(a)
    r_b, b = sort_and_count(b)
    r, l = merge_and_count(a, b)
  end
  
  return r_a + r_b + r, l
end

counter = 0
input_data = []
File.open("IntegerArray.txt", "r") do |infile|
    while (line = infile.gets)
        puts "#{counter}: #{line}"
        counter = counter + 1
        input_data << line.to_i
    end
end

p sort_and_count(input_data)[0]