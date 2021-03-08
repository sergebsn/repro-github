user_input = int(input('Input positive number: '))
if user_input > 0:
    ost_del = user_input % 10
    bez_ost = user_input // 10
    while bez_ost > 0:
        if bez_ost % 10 > ost_del:
            ost_del = bez_ost % 10
        bez_ost = bez_ost // 10
    print('Most big number is: ', ost_del)
else:
    print("It's not a positive number. Please try again.")

