

# Execution Time Difference
# Learning Goals
# Be able to determine the time and space complexity of a method
# Be able to compare the time complexity of one method to another
# Be able to recognize when time or space complexity can be improved


# my_min
# Given a list of integers find the smallest number in the list.

# Example:

#     list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5
# Phase I
# First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?



def my_min(arr)
  output = arr.first
  
  (1...arr.length).each do |i|
    (i+1...arr.length).each do |j|
      output = arr[j] if arr[j] < output
    end
  end
  
  output
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5


# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?

def my_min_2(arr)
  min = arr.shift

  (0...arr.length).each do |i|
    min = arr[i] if min > arr[i]
  end
  
  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_2(list)  # =>  -5





# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.

# Example:

#     list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7

# Example 2:

#     list = [2, 3, -6, 7, -6, 7]
#     largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# Example 3:

#     list = [-5, -1, -3]
#     largest_contiguous_subsum(list) # => -1 (from [-1])

# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops. First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.

# Discuss the time complexity of this solution.

def largest_contiguous_subsum(arr)
  subsets = [] 

  (0...arr.length).each do |i| 
    (i...arr.length).each do |j| 
      subsets << arr[i..j]
    end 
  end 
  
  subsets.map {|sub| sub.sum}.max 
end

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])




# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory. Keep a running tally of the largest sum.

# Get your story straight, and then explain your solution's time complexity to your TA.

def largest_contiguous_subsum_2(arr)
  (1...arr.length).each do |i|
    if arr[i] + arr[i - 1] > 0
      arr[i] = arr[i] + arr[i - 1]
    elsif arr[i] < 0 && arr[i-1] < 0
      arr[i] = [arr[i-1], arr[i]].max
    else
      arr[i] = 0
    end
  end

  arr.max
end

# [2,3,-6,7,-6,7]
# [2,5,]

# [-5,-1,-3]
# [-5,-1,]

list = [2, 3, -6, 7, -6, 7]
list2 = [-9,-7,-5,-3,-16,0]
list3 = [3, 9, 5, 7, 2, 1, 0]
p largest_contiguous_subsum_2(list) # => 8 (from [7, -6, 7])
p largest_contiguous_subsum_2(list2) # => 0
p largest_contiguous_subsum_2(list3) # => 0

list = [-5, -1, -3]
p largest_contiguous_subsum_2(list) # => -1 (from [-1])

