
using DelimitedFiles

a = readdlm("day1.txt")

function add_frequencies(a)
    freq = 0
    for value in a
        freq += value
    end
return freq
end

@time add_frequencies(a)

function second_frequency(a)
    freq = 0
    freq_list = Float64[0]
    while true
        for value in a
            freq = freq + value
            if freq in freq_list
                println("Yes")
                return freq
                break
            end
            push!(freq_list, freq) 
        end
    end
end

@time second_frequency(a)




