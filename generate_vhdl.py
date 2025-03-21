#!/bin/python3

input = [0, 0, 0, 0, 0]

def generate_perm(input, i):
    if i >= len(input):
        display_vhdl(input)
    else:
        input[i] = 0
        generate_perm(input, i+1)
        input[i] = 1
        generate_perm(input, i+1)

def display_vhdl(input):
    sum = 0
    curr = 2
    for i in range(len(input)-1, -1, -1):
        digit = input[i]
        sum += curr*digit
        curr*=2

    units = sum%10
    tens = (sum-units)//10
    out = []
    out.append(bin(units)[-2])
    out.append(bin(units)[-3])
    out.append(('0'+bin(units))[-4])

    out.append(bin(tens)[-1])
    out.append(bin(tens)[-2])
    out.append(bin(tens)[-3])
    
    for i in range(len(out)):
        if out[i] == 'b':
            out[i] = '0'

    output = "".join([str(x) for x in reversed(out)])

    print(f'\t\t\twhen "{"".join([str(x) for x in input])}" =>')
    print(f'\t\t\t\tY <= "{output}"; -- {sum} {sum + 1}')



generate_perm(input, 0)

