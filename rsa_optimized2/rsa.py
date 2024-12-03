def rsa(d: int, N: int, y: int, bitwidth: int) -> int:
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
    print(f't after mod_product = {t}')

    for _ in range(bitwidth):
        if d & 1:
            print(f'before montgomery: m = {m}, t = {t}')
            m = montgomery(N, m, t, bitwidth)
            print(f'm after montgomery = {m}')
        print(f'before montgomery: t = {t}')
        t = montgomery(N, t, t, bitwidth)
        print(f'after montgomery: t = {t}')
        d >>= 1
        if d == 0:
            break

    return m

# Example usage
result = rsa(d=40077, N=40633, y=8454, bitwidth=16)  # Example: d=13, N=23, y=5, bitwidth=5
# print(f"RSA Result: {result}")

print(pow(8454, 40077, 40633))


def montgomery(N: int, a: int, b: int, bitwidth: int) -> int:
    """
    Montgomery modular multiplication helper function.
    """
    m = 0
    for _ in range(bitwidth):
        if a & 1:
            m += b
            print(f'a & 1, m = {m}')
        if m & 1:
            m += N
            print(f'm & 1, m = {m}')
        m >>= 1
        a >>= 1
    if m >= N:
        m -= N
    # print(f'm = {m}')
    return m

print(f'result = {montgomery(40633, 33662, 38311, 16)}')