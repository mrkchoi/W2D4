

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
  
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]