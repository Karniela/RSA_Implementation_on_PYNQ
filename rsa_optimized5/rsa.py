import sympy
import random

def mod_exp(d: int, N: int, y: int, bitwidth: int) -> int:
    """
    RSA modular exponentiation using Montgomery reduction.

    Parameters:
    d (int): The private exponent.
    N (int): The modulus.
    y (int): The base.
    bitwidth (int): Bitwidth of the operands.

    Returns:
    int: The result of modular exponentiation.
    """
    def mod_product(a: int, b: int, N: int, bitwidth: int) -> int:
        """
        Modular product helper function.
        """
        m = 0
        t = b
        for _ in range(bitwidth + 1):
            if a & 1:
                if m + t >= N:
                    m = m + t - N
                else:
                    m = m + t
            if t + t > N:
                t = t + t - N
            else:
                t = t + t
            a >>= 1
            if a == 0:
                break
        return m

    def montgomery(N: int, a: int, b: int, bitwidth: int) -> int:
        """
        Montgomery modular multiplication helper function.
        """
        m = 0
        for _ in range(bitwidth):
            if a & 1:
                m += b
            if m & 1:
                m += N
            m >>= 1
            a >>= 1
        if m >= N:
            m -= N
        # print(f'm = {m}')
        return m

    # RSA implementation
    a = 1 << bitwidth  # Equivalent to 2^BITWIDTH
    t = mod_product(a, y, N, bitwidth)
    m = 1

    for _ in range(bitwidth):
        if d & 1:
            m = montgomery(N, m, t, bitwidth)
        t = montgomery(N, t, t, bitwidth)
        d >>= 1
        if d == 0:
            break

    return m

# def mod_exp(exp, mod, base, _):
#     """
#     Perform modular exponentiation: (base^exp) % mod
#     """
#     result = 1
#     b = base % mod  # Ensure base is within mod
    
#     for i in range(128):
#         #pragma HLS PIPELINE OFF
#         if (exp & 1):
#             # result = mod_product(b, result, mod);
#             result = b * result % mod
        
#         # b = (b * b) % mod;
#         b = b * b % mod
#         exp = exp >> 1
    
#     return result

def mod_inverse(a, mod):
    """
    Compute the modular multiplicative inverse of a under modulus mod
    """
    m0, x0, x1 = mod, 0, 1
    if mod == 1:
        return 0  # Modular inverse does not exist for mod=1
    
    while a > 1:
        q = a // mod
        a, mod = mod, a % mod
        x0, x1 = x1 - q * x0, x0
        # print(f'x0 = {x0}, x1 = {x1}')
    
    if x1 < 0:
        x1 += m0  # Make result positive
        # print(f'x1 = {x1}')
    
    return x1

def crt_rsa(p, q, N, y, d):
    """
    Decrypt RSA ciphertext y using CRT optimization
    Inputs:
      - p, q: Prime factors of N
      - N: Public modulus (p * q)
      - y: Ciphertext
      - d: Private exponent
    Output:
      - Decrypted plaintext
    """
    # Compute CRT parameters
    dp = d % (p - 1) # dp is now bitwidth / 2 bits
    dq = d % (q - 1) # dq is now bitwidth / 2 bits
    # Modular exponentiation for m_p and m_q
    mp = mod_exp(dp, p, y % p, 128)
    mq = mod_exp(dq, q, y % q, 128)
    q_inv = mod_inverse(q, p)

    mm = mp - mq if mp > mq else mq - mp
    h = mm * q_inv % p
    if (mp < mq):
        h = p - h
    m = (mq + h * q) 

    return m



# Test the implementation
if __name__ == "__main__":
    # Example parameters
    p = 170141183460469231731687303715884116147  # Prime p
    q = 170141183460469231731687303715884114527  # Prime q
    e = 65537
    d = pow(e, -1, (p-1) * (q-1))
    N = p * q  # Modulus
    x = random.randint(1, (p-1) * (q-1) - 1)
    y = pow(x, e, N) 
    x2 = pow(y, d, N)
    
    # Decrypt using CRT-based RSA
    m = crt_rsa(p, q, N, y, d)
    print(f'Original message: {x}')
    print(f'golden: {x2}')
    print(f"Decrypted plaintext: {m}")