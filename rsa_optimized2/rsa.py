# def rsa(d: int, N: int, y: int, bitwidth: int) -> int:
#     """
#     RSA modular exponentiation using Montgomery reduction.

#     Parameters:
#     d (int): The private exponent.
#     N (int): The modulus.
#     y (int): The base.
#     bitwidth (int): Bitwidth of the operands.

#     Returns:
#     int: The result of modular exponentiation.
#     """
#     def mod_product(a: int, b: int, N: int, bitwidth: int) -> int:
#         """
#         Modular product helper function.
#         """
#         m = 0
#         t = b
#         for _ in range(bitwidth + 1):
#             if a & 1:
#                 if m + t >= N:
#                     m = m + t - N
#                 else:
#                     m = m + t
#             if t + t > N:
#                 t = t + t - N
#             else:
#                 t = t + t
#             a >>= 1
#             if a == 0:
#                 break
#         return m

#     def montgomery(N: int, a: int, b: int, bitwidth: int) -> int:
#         """
#         Montgomery modular multiplication helper function.
#         """
#         m = 0
#         for _ in range(bitwidth):
#             if a & 1:
#                 m += b
#             if m & 1:
#                 m += N
#             m >>= 1
#             a >>= 1
#         if m >= N:
#             m -= N
#         # print(f'm = {m}')
#         return m

#     # RSA implementation
#     a = 1 << bitwidth  # Equivalent to 2^BITWIDTH
#     t = mod_product(a, y, N, bitwidth)
#     m = 1
#     print(f't after mod_product = {t}')

#     for _ in range(bitwidth):
#         if d & 1:
#             print(f'before montgomery: m = {m}, t = {t}')
#             m = montgomery(N, m, t, bitwidth)
#             print(f'm after montgomery = {m}')
#         print(f'before montgomery: t = {t}')
#         t = montgomery(N, t, t, bitwidth)
#         print(f'after montgomery: t = {t}')
#         d >>= 1
#         if d == 0:
#             break

#     return m

# # Example usage
# result = rsa(d=40077, N=40633, y=8454, bitwidth=16)  # Example: d=13, N=23, y=5, bitwidth=5


def extended_gcd(a: int, b: int) -> tuple[int, int, int]:
    """
    Compute the greatest common divisor (GCD) of a and b using the Extended Euclidean Algorithm.
    Returns (g, x, y) such that ax + by = g = gcd(a, b).
    """
    if b == 0:
        return a, 1, 0
    g, x1, y1 = extended_gcd(b, a % b)
    x = y1
    y = x1 - (a // b) * y1
    return g, x, y


def mod_inverse(a: int, n: int) -> int:
    """
    Compute the modular inverse of a modulo n.
    Returns x such that (a * x) % n == 1.
    """
    g, x, _ = extended_gcd(a, n)
    if g != 1:
        raise ValueError("Modular inverse does not exist")
    return x % n


def chinese_remainder_theorem(c1: int, c2: int, p: int, q: int) -> int:
    """
    Combine results from two moduli using the Chinese Remainder Theorem.

    Parameters:
    c1 (int): Result modulo p.
    c2 (int): Result modulo q.
    p (int): First prime.
    q (int): Second prime.

    Returns:
    int: Combined result modulo pq.
    """
    n = p * q
    m1 = q * mod_inverse(q, p)
    m2 = p * mod_inverse(p, q)
    return (c1 * m1 + c2 * m2) % n


def rsa_decrypt_crt(c: int, d: int, p: int, q: int) -> int:
    """
    Decrypt RSA ciphertext using the Chinese Remainder Theorem.

    Parameters:
    c (int): Ciphertext.
    d (int): Private exponent.
    p (int): First prime factor of the modulus.
    q (int): Second prime factor of the modulus.

    Returns:
    int: Decrypted plaintext.
    """
    # Compute ciphertext modulo p and q
    c1 = pow(c, d, p)
    c2 = pow(c, d, q)

    # Combine results using CRT
    return chinese_remainder_theorem(c1, c2, p, q)


# Example usage
ciphertext = 2790
private_exponent = 2753
prime_p = 61
prime_q = 53

plaintext = rsa_decrypt_crt(ciphertext, private_exponent, prime_p, prime_q)
print(f"Decrypted plaintext: {plaintext}")
