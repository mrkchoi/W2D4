# Anagrams
# Our goal today is to write a method that determines if two given words are anagrams. This means that the letters in one word can be rearranged to form the other word. For example:

# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# Assume that there is no whitespace or punctuation in the given strings.

# Learning Goals
# Be able to determine the time and space complexity of a method
# Be able to recognize when and how time or space complexity can be improved
# Be able to compare different methods and discuss how changing inputs affects each one's overall runtime

# Phase I:
# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. Check if the second string is one of these.

def first_anagram?(str1, str2)
  arr1 = str1.chars
  perms = permutations(arr1).map do |perm| # => 'ab' => [[a,b],[b,a]] => ['ab', 'ba']
    perm.join('')
  end

  perms.include?(str2)
end


# def permutations(arr) 
#   return [[]] if arr.empty?

#   last = arr.last
#   perms = permutations(arr[0..-2])
#   output = []

#   perms.each do |perm|
#     cur_perms = []

#     (0..perm.length).each do |i|
#       cur_perm = perm.dup
#       cur_perms << cur_perm.insert(i, last)
#     end  

#     output += cur_perms
#   end

#   output
# end










































def permutations(arr)
  return [[]] if arr.empty? 
  
  #last element arr
  #putting before and after every index of a perm
  #permuatations(arr[0..-2])
  #last = arr[-1]
  
  last = arr[-1]
  perms  = permutations(arr[0..-2])
  result = [] 
  perms.each do |sub_arr| #[a,b]
    current_perms = []
    (0..sub_arr.length).each do |i|
      dup = sub_arr.dup 
      current_perms << dup.insert(i,last) # dup = ['b','a']
    end  
     result += current_perms
  end 

  result 
end

# [[a,b], [b,a]]
# sub_arr = ['b','b','a']
# last = 'b'
# current_perm = [['b', 'a']]


#p permutations([]) # => [] => [[]]
#p permutations(['a']) # => [a] => [[a]]
p permutations(['a', 'b']) # => [a,b] => [[a,b], [b,a]]
p permutations([1,2,3,4,5,6,7,8,9,10]) # => [a,b] => [[a,b], [b,a]]

# => [] => [[]]
# => [a] => [[a]]
# => [a,b] => [[a,b], [b,a]]
# => [a,b,c] => [[a,b,c], [a,c,b], [b,a,c], [b,c,a], [c,a,b], [c,b,a]]






























# p permutations([]) # => [] => [[]]
# p permutations(['a']) # => [a] => [[a]]
# p permutations(['a', 'b']) # => [a,b] => [[a,b], [b,a]]
# p permutations(['a', 'b', 'c']) # => [a,b] => [[a,b], [b,a]]

# => [] => [[]]
# => [a] => [[a]]
# => [a,b] => [[a,b], [b,a]]
# => [a,b,c] => [[a,b,c], [a,c,b], [b,a,c], [b,c,a], [c,a,b], [c,b,a]]


# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true





# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?

# Phase II:
# Write a method #second_anagram? that iterates over the first string. For each letter in the first string, find the index of that letter in the second string (hint: use Array#find_index) and delete at that index. The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.

def second_anagram?(str1, str2)
  arr1 = str1.chars 
  arr2 = str2.chars

  arr1.each do |ch| 
    arr2.delete(ch)
  end
  
  arr2.empty?
end


# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true




# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??

# Phase III:
# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. The strings are then anagrams if and only if the sorted versions are the identical.


def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

# Time complexity: O(nlog(n))
# Space complexity: O(n)



# What is the time complexity of this solution? Is it better or worse than #second_anagram??

# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to store the number of times each letter appears in both words. Compare the resulting hashes.

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char {|char| hash1[char] += 1}
  str2.each_char {|char| hash2[char] += 1}

  hash1 == hash2
end

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true


# Time complexity: O(n)
# Space complexity: O(n)


# What is the time complexity?

# Bonus: Do it with only one hash.

# Discuss the time complexity of your solutions together, then call over your TA to look at them.
