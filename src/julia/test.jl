1 + 1

# %% CELL Xy
1 + 3
2^10

# %% CELL Xy

a = "Hello, how are you ?"
vowels = "aeiouy"

for c in a
    if c in vowels
        print(c)
    end
end

Pkg.add("Winston")
using Winston
