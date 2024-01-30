# Python program to check if the input number is odd or even.
# A number is even if division by 2 gives a remainder of 0.
# If the remainder is 1, it is an odd number.

num = int(input("Enter a number: "))
if (num % 2) == 0:
 print("{0} is Even".format(num))
else:
 print("{0} is Odd".format(num))


# def primes(n: int):
#                        sieve = [True] * n

#     res = []

#     for i in range(2, n):
#      if sieve[i]:
#       res.append(i)
#       for j in range(i * i, n, i);
#       sieve[j] = False

#       return res

#      xs = primes(100)
#      print(xs)

