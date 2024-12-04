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



def montgomery(N: int, a: int, b: int, bitwidth: int) -> int:
    """
    Montgomery modular multiplication helper function.
    """
    m = 0
    m2 = 0
    for _ in range(bitwidth):
        print(f'before: m2 = {m2}')
        if a & 1:
            m2 += b
            print(f'm2 += b = {m2}')
        if m2 & 1:
            m2 += N
            print(f'm2 += N = {m2}')
        print(f'before m = {m}')
        # if((a & 1) and (((b & 1) != (m & 1)))):
        #     # print(f'm = {m}, m & 1 = {m & 1}, b = {b}, b & 1 = {b & 1}, logic = {(~((b & 1) != (m & 1)))}')
        #     m = m + b + N
        #     print(f'm += b + N = {m}')
        # elif((~(a & 1) and (m & 1))):
        #     m = m + N
        #     print(f'm += N = {m}')
        # elif((a & 1)):
        #     m = m + b
        #     print(f'm += b = {m}')
        d1 = b if (a & 1) else 0
        d2 = N if (((m & 1) and (~(a & 1) and ~(b & 1))) or ((a & 1) and (b & 1) and ~(m & 1))) else 0
        print(f'd1 = {d1}, d2 = {d2}')
        m = m + d1 + d2
        print(f'after m = {m}, m2 = {m2}')
        m2 >>= 1
        m >>= 1
        a >>= 1
    if m >= N:
        m -= N
    if m2 >= N:
        m2 -= N
    print(f'm = {m}, m2 = {m2}')
    return m

montgomery(28948022309329048855892746252171981402981537383894273816512899164258300594241, 17519000568021920500922536647074530486618270853232372650071722198659287021156, 17519000568021920500922536647074530486618270853232372650071722198659287021156, 256)