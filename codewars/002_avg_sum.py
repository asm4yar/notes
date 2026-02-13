def get_grade(s1, s2, s3):
    # Code here
    score = (s1 + s2 + s3) / 3

    if score >= 90:
        return "A"
    elif score >=80:
        return "B"
    elif score >= 70:
        return "C"
    elif score >= 60:
        return "D"
    else:
        return "F"


print(get_grade(95, 90, 93))
print(get_grade(70, 70, 100))
print(get_grade(100, 85, 96))
print(get_grade(92, 93, 94))
print(get_grade(58, 58, 58))
