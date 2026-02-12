def process(input_string: str) -> str:
    numbers = list(map(int, input_string.split()))

    above = sum(1 for n in numbers if n > 0)
    below = sum(1 for n in numbers if n < 0)
    equal = sum(1 for n in numbers if n == 0)

    return f"выше нуля: {above}, ниже нуля: {below}, равно нулю: {equal}"


input_string = input()
output_string = process(input_string)
print(output_string)
