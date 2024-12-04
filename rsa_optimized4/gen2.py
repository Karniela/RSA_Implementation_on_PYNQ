import random
import math
import sympy

half_bit = 128
file_length = 100


def gen_p_q(bit):
    primes = [i for i in range(1 << (bit-2), min((1 << (bit - 2)) + 20000, (1 << (bit-1)))) if sympy.isprime(i)]
    print(primes)
    while(True):
        p = random.choice(primes)
        if(sympy.isprime(2*p+1)):
            break
        else:
            print("find another")
    while(True):
        q = random.choice(primes)
        if(sympy.isprime(2*q+1) and q != p):
            break
        else:
            print("find another")
    return 2*p+1, 2*q+1


def gen_d(e, p, q):
    d = pow(e, -1, (p-1) * (q-1))
    return d

p, q = gen_p_q(half_bit)
e = 65537
d = gen_d(e, p, q)
n = p * q

print(f'p = {p}, q = {q}, e = {e}, d = {d}, n = {n}')

print(f'e * d % (p-1) * (q-1) = {e * d % ((p-1) * (q-1))}')

x = [random.randint(1, (p-1) * (q-1) - 1) for i in range(file_length)]
y = [pow(x[i], e, n) for i in range(file_length)]
x2 = [pow(y[i], d, n) for i in range(file_length)]

print(x[0])
print(y[0])
print(x2[0])

with open("./data/golden.txt", "w") as f:
    for i in range(file_length):
        f.writelines(f'{x[i]}\n')
    f.close()

with open("./data/input.txt", "w") as f1:
    f1.write(f'{(1 << (2 * half_bit)) // (p-1)}\n')
    f1.write(f'{(1 << (2 * half_bit)) // (q-1)}\n')
    f1.write(f'{p}\n')
    f1.write(f'{q}\n')
    f1.write(f'{n}\n')
    f1.write(f'{d}\n')
    for i in range(file_length):
        f1.write(f'{y[i]}\n')
    f1.close()    
