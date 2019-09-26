function binaryintervalsearch(x, delta, coordinate)
    liste = []
    max = 0
    min = x[1]
    len = length(x, 1)
    

    if length(x, 1) % 2 == 0
        n1 = x[div(length(x),2), coordinate]
        n2 = x[div(length(x, 2)-1), coordinate]
        median = x[div((n1 + n2), 2)]
        return median
    else
        median = x[div(length((x,1)+1), 2), coordinate]
    end
    
    delta_min = median - delta
    delta_max = median + delta
    count1 = 1
    count2 = 1

    for i in 1:len
        if x[i, coordinate] >= delta_min 
            liste[1] = count1
            break
        else count1 +=1
        end
    end
    for j in 1:len  
        if x[i, coordinate > delta_max]
            liste[2] = count2-1
            break
        else count2 += 1

        end
    end
    return liste
end




function testfunction(coordinate, delta)
    test_array1 = [1 2; 2 3; 3 0; 4 0; 5 1]
    test_array2 = [1 0; 2 0; 2 0; 3 0; 4 0; 5 0; 5 0]
    test = binaryintervalsearch(test_array1, coordinate, delta)
    println(test)
end



testfunction(1, 1.5)
