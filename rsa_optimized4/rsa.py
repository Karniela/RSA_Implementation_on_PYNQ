import sympy
import random

def barrett_reduction(x, n):
    """
    Perform Barrett Reduction to compute x mod n.
    
    Parameters:
        x (int): The input number to reduce (x >= 0).
        n (int): The modulus (n > 0).
    
    Returns:
        int: The result of x % n using Barrett Reduction.
    """
    if n <= 0:
        raise ValueError("Modulus n must be greater than 0")
    if x < 0:
        raise ValueError("Input x must be non-negative")
    
    assert x <= pow(n, 2)
    
    k = n.bit_length()
    mu = (1 << (2 * k)) // n

    q1 = x * mu
    q3 = q1 >> (2*k)
    t = x - q3 * n

    if t >= n:
        t -= n
    elif t < 0:
        t += n

    return t

def mod_exp(base, exp, mod):
    """
    Perform modular exponentiation: (base^exp) % mod
    """
    result = 1
    # base = base % mod  # Ensure base is within mod
    b = barrett_reduction(base, mod)
    
    for i in range(128):
        #pragma HLS PIPELINE OFF
        if (exp & 1):
            # result = mod_product(b, result, mod);
            result = barrett_reduction(b * result, mod)
        
        # b = (b * b) % mod;
        b = barrett_reduction(b * b, mod)
        exp = exp >> 1
    
    return result

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
    # dp = d % (p - 1) # dp is now bitwidth / 2 bits
    dp = barrett_reduction(d, p-1)
    # dq = d % (q - 1) # dq is now bitwidth / 2 bits
    dq = barrett_reduction(d, q-1)
    # print(f'dp = {dp}\ndq = {dq}')
    q_inv = mod_inverse(q, p)
    # print(f'q_inv = {q_inv}')
    
    # Modular exponentiation for m_p and m_q
    mp = mod_exp(y, dp, p)
    # print(f'mp = {mp}')
    mq = mod_exp(y, dq, q)
    # print(f'mq = {mq}')
    
    # CRT combination
    # h = (q_inv * (mp - mq)) % p
    # if h < 0:
    #     h += p  # Ensure h is non-negative
    
    mm = mp - mq if mp > mq else mq - mp
    h = barrett_reduction(mm * q_inv, p)
    if (mp < mq):
        h = p - h
    
    
    m = (mq + h * q) 
    return m



# Test the implementation
if __name__ == "__main__":
    # Example parameters
    p = 170141183460469231731687303715884116147  # Prime p
    q = 170141183460469231731687303715884114527  # Prime q
    N = p * q  # Modulus
    y = 15992842325075000729298110246954337332725622601628670928350614326331907696315  # Ciphertext
    d = 5978919236142606547650399213717440902551390268385239648859999103680819781761  # Private exponent
    
    # Decrypt using CRT-based RSA
    m = crt_rsa(p, q, N, y, d)
    print(f"Decrypted plaintext: {m}")