viruch = float(input('Введите сумму выручки: '))
zatrat = float(input('Введите сумму затрат: '))

if viruch > zatrat:
    print(f'Рентабельность выручки - {viruch / zatrat}')
    workers = int(input('Введите кол-во сотрудников: '))
    print(f'Выручка на одного сотрудника:  {viruch / workers}')
elif viruch == zatrat:
    print('Работаем в ноль')
else:
    print('Работаем в убыток')