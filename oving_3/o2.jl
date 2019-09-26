#ty til HKiær for coop

function binaryintervalsearch(x, delta, coordinate)
    liste = []
    err = []
    max = 0
    min = x[1]
    len = size(x, 1)
    push!(err, -1)
    push!(err, -1)
    print(liste)

    

    if len % 2 == 0
        temp = fld(len,2)
        n1 = x[temp, coordinate]
        n2 = x[temp + 1, coordinate]
        median = (n1 + n2)/ 2
    else
        median = x[div(len, 2)+1, coordinate]
    end
    
    delta_min = median - delta
    delta_max = median + delta
    count1 = 1
    count2 = 1

    for i in 1:len
        if x[i, coordinate] >= delta_min 
            push!(liste, count1)
            break
        else count1 +=1
        end
    end
    for j in 1:len  
        if x[j, coordinate] > delta_max
            push!(liste, count2-1)
            break
        else count2 += 1
        end
    end

    if length(liste) == 1
        push!(liste, len)
    end
    if length(liste) <= 1
        return err
    elseif liste[1] > liste[2]
        return err
    end
    return liste
end




