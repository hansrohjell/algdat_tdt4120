
function mergearrays(x,y,coordinate)
    n1 = length(x[:,coordinate])
    n2 = length(y[:,coordinate])
    lhs = [x; Inf Inf]
    rhs = [y; Inf Inf]
    x_index = 1
    y_index = 1
    m_array = [zeros(Int64, n1) zeros(Int64, n1)]
    #@show merged
    for i in 1:n1
       if lhs[x_index,coordinate] > rhs[y_index,coordinate]
           m_array[i,:] = rhs[y_index,:]
           y_index += 1
        else 
            m_array[i,:] = lhs[x_index,:]
            x_index += 1
        end
        
       # @show m_array
    end
    return m_array
end


#funker foreløpig ikke - mdrfkr

function mergesort(x, coordinate)
    size_array = size(x, coordinate)
    if size_array == 1 || size_array == 0
        return x
    elseif size_array % 2 == 0
        lhs = mergesort(x[1:div(size_array,2), :], coordinate)
        rhs = mergesort(x[div(size_array,2)+1:end, :], coordinate)
        #@show lhs
        #@show rhs
    else
        lhs = mergesort(x[1:div(size_array,2)+1, :], coordinate)
        rhs = mergesort(x[div(size_array,2)+2:end, :], coordinate)
        #@show lhs
        #@show rhs
    end
end



function testfunction(coordinate)
    test_array1 = [1 2; 4 6; 2 1;3 4;5 6;1 8]
    test_array2 = [3 5; 2 1; 4 3]
    x = [1 2;2 1;3 4]
    y = [2 2;4 1;5 6]
    #test_mergearrays = mergearrays(x, y, coordinate)
    #return test_mergearrays
    test_mergesort = mergesort(x, coordinate)
    return test_mergesort
    
end

println(testfunction(1))
