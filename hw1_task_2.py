# мне кажется у меня это задание получилось очень какое-то мутное)
sec_num = int(input('Input number of second: '))
num_h = sec_num // 3600
num_m = (sec_num - (num_h * 3600)) // 60
num_s = (sec_num - (num_h * 3600) - (num_m * 60))
print(f'hh:{num_h} mm:{num_m} ss:{num_s}')
