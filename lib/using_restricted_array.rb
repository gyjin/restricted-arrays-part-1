require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n) where n is the array
# Space complexity: O(1) 
def length(array)
  counter = 0
  until array[counter] == nil
    counter += 1
  end
  return counter
end

# Prints each integer values in the array
# Time complexity: O(n) where n is the array
# Space complexity: O(n) where n is the array
def print_array(array)
  counter = 0
  printed = ""
  length(array).times do
    if counter == (length(array) - 1)
      printed = printed + "#{array[counter]}"
      counter += 1
    else
      printed = printed + "#{array[counter]} "
      counter += 1
    end
  end
  return printed
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n) where n is the array
# Space complexity: O(1)
def search(array, length, value_to_find)
  counter = 0
  while counter < length
    if array[counter] == value_to_find
      return true
    else
      counter += 1
    end
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n) where n is the array
# Space complexity: O(1)
def find_largest(array, length)
  if length == 0
    return nil
  end
  
  largest_value = array[0]
  counter = 0
  
  while counter < length
    if array[counter] > largest_value
      largest_value = array[counter]
    end
    counter +=1
  end
  return largest_value
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n) where n is the array
# Space complexity: O(1)
def find_smallest(array, length)
  if length == 0
    return nil
  end
  
  smallest_value = array[0]
  counter = 0
  
  while counter < length
    if array[counter] < smallest_value
      smallest_value = array[counter]
    end
    counter +=1
  end
  return smallest_value
end

# Reverses the values in the integer array in place
# Time complexity: O(n) where n is the array
# Space complexity: O(1)
def reverse(array, length)
  if length < 2
    return array
  end
  
  front = 0
  back = length - 1
  
  while front < back
    holder = array[front]
    array[front] = array[back]
    array[back] = holder
    
    front += 1
    back -= 1
  end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log n) where n is the array
# Space complexity: O(1)
def binary_search(array, length, value_to_find)
  if length == 0
    return false
  end
  
  low = 0
  high = length - 1
  
  while low <= high
    mid = (low + high) / 2
    
    if array[mid] == value_to_find
      return true
    elsif array[mid] < value_to_find
      low = mid + 1
    elsif array[mid] > value_to_find
      high = mid - 1
    end
  end
  return false
end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2), where n is the number of elements in the array.
# To find the correct value for index 0, a total of (n-1) comparisons are needed.
# To find the correct value for index 1, a total of (n-2) comparisons are needed.
# To find the correct value for index 2, a total of (n-3) comparisons are needed.
# and so on ...
# To find the correct value for index (n-2), a total of 1 comparisons is needed.
# To find the correct value for the last index, a total of 0 comparisons are needed.
# Total number of comparisons = (n-1) + (n-2) + ... 3 + 2 + 1
#                             = (n * (n-1))/2
# This is O(n^2) in Big O terms.
# Space complexity = constant or O(1) since the additional storage needed,
# does not depend on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---
