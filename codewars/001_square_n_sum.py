def square_sum(numbers):
    return sum(x**x for x in numbers)


input = [1, 2, 2]
# 1**2+2**2+2**2 = 1 + 4 + 4

print(square_sum(input))
