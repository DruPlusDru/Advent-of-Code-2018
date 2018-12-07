
using DelimitedFiles

a = readdlm("day2.txt")

function check_boxes(a)
    check_sum = Int64[0,0]
    for box in a
        letter_dict = Dict{Char,Int64}()
        letter_list = Char[]
        for letter in box
            letter_dict[letter] = get(letter_dict, letter, 0)+1
            push!(letter_list,letter)
        end
        for letter in letter_list
            if letter_dict[letter] == 2
                check_sum[1] = check_sum[1] + 1
                break
            end
        end
        for letter in letter_list
            if letter_dict[letter] == 3
                check_sum[2] = check_sum[2] + 1
                break
            end
        end
    end
    return check_sum[1] * check_sum[2]
end

@time check_boxes(a)

function find_boxes(a)
    box_list = String[]
    for box in a
        push!(box_list, box)
        for box2 in a
            if box2 in box_list
                continue
            else
                differences = 0
                for letter in 1:length(box)
                    if box[letter] != box2[letter]
                        differences += 1
                        if differences > 1
                            break
                        end
                    end
                end
                if differences == 1
                    return box, box2
                end
            end
        end
    end  
end

@time find_boxes(a)






