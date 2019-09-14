
array_test = [10,5,16,0]
max_num = 8

function reverseandlimit(array, maxnumber)
    revArray = []
    for i in 1:length(array)
        x = pop!(array)
        push!(revArray, x)
        if revArray[i] > maxnumber
            revArray[i] = maxnumber
        end
    end
    return revArray
         
end


println(reverseandlimit(array_test, max_num))