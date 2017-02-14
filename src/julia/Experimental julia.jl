# %% Just to test functionality of julia:
1 + 1
1 + 3
2^10

# %% Try-out some for loop
a = "Hello, how are you ?"
vowels = "aeiouy"
for c in a
    if c in vowels
        print(c)
    end
end

# %% Check if plotting is working:
using Winston
# plot some data
pl = plot(cumsum(rand(500) .- 0.5), "r", cumsum(rand(500) .- 0.5), "b")
# display the plot (not done automatically!)
display(pl)
