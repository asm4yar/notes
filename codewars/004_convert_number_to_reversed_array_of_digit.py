def digitize(n):
    # return list(map(int, str(n)[::-1]))
    return [int(i) for i in str(n)[::-1]]


print(digitize(35231))
