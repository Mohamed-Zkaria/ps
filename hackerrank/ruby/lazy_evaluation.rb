# https://www.hackerrank.com/challenges/ruby-lazy/problem


# Lazy evaluation is an evaluation strategy that delays the assessment of an expression until its value is needed.

# Ruby  introduced a lazy enumeration feature. Lazy evaluation increases performance by avoiding needless calculations, and it has the ability to create potentially infinite data structures.

# Example:

# power_array = -> (power, array_size) do 
#     1.upto(Float::INFINITY).lazy.map { |x| x**power }.first(array_size) 
# end

# puts power_array.(2 , 4)    #[1, 4, 9, 16]
# puts power_array.(2 , 10)   #[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
# puts power_array.(3, 5)     #[1, 8, 27, 64, 125]
# In this example, lazy avoids needless calculations to compute power_array.
# If we remove lazy from the above code, then our code would try to compute all  ranging from  to Float::INFINITY.
# To avoid timeouts and memory allocation exceptions, we use lazy. Now, our code will only compute up to first(array_size).

# Task

# Your task is to print an array of the first  palindromic prime numbers.
# For example, the first  palindromic prime numbers are .

# Input Format

# A single line of input containing the integer .

# Constraints

# You are not given how big  is.

# Output Format

# Print an array of the first  palindromic primes.

# Sample Input

# 5
# Sample Output

# [2, 3, 5, 7, 11]










# Enter your code here. Read input from STDIN. Print output to STDOUT


def palindrome? str
    mid_point = (str.length / 2)
    left_index = 0
    right_index = str.length - 1
    while left_index < mid_point && right_index > mid_point
        return false unless str[left_index] == str[right_index]
        left_index += 1
        right_index -= 1
    end
    str[left_index] == str[right_index] && str[mid_point] == str[left_index]
end

def prime? num
    return false if num < 2
    square_root = Integer.sqrt num    
    (2..square_root).each do |number|
        return false if num % number == 0
    end
    true
end


number = gets

number = number.to_i

palindromic_prime = -> (array_size){
    1.upto(Float::INFINITY).lazy.select { |num|
        # puts "#{num} prime?: #{prime?(num)}"
        # puts "#{num} palindrome?: #{palindrome?(num.to_s)}"
        
        # puts palindrome?(num.to_s) && prime?(num)
        palindrome?(num.to_s) && prime?(num)
    }.first(array_size)
}


print palindromic_prime.(number)
