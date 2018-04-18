# Calcular los primeros N = 20 elementos de la serie de Fibonacci
# F_n = F_{n-1} + F_{n-2}
# con F_1 = 1 y F_2 = 1

N     <- 20
fn    <- vector("numeric", N)
fn[1] <- 1
fn[2] <- 1
for (n in 3:N) {
  fn[n] = fn[n - 1] + fn[n - 2]
}

# Comparar con https://en.wikipedia.org/wiki/Fibonacci_number#List_of_Fibonacci_numbers
print(fn)

# Devolver las primeras cinco
head(fn, 5)

# Devolver las últimas cinco
tail(fn, 5)

# Devolver todas, excepto las primeras cinco (n > 5)
fn[-(1:5)]
fn[1:N > 5]
tail(fn, -5)

# Devolver todas, excepto las últimas cinco (n < N - 5)
fn[-((N - 4):N)]
fn[1:N < N - 4]
head(fn, -5)
