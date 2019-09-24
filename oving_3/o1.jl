
function mergearrays(x,y, coordinate)
    x_index = 1
    y_index = 1
    Left = [x;Inf Inf]
    Right = [y;Inf Inf]
    n1 = lenght(x[:, coordinate])
    n2 = lenght(y[:, coordinate])
    m_array = [zeros(Int64, n1) zeros(Int64, n1)
    @show m_array
    for i in 1:n1
        if Left(x_index, coordinate) > Right(y_index, coordinate)
            m_array[i, :] = Left[y_index, :]
            y_index += 1

        else
            m_array[i, :] = Left[x_index, :]
            x_index += 1
        end
        @show m_array
    end
    return m_array
end




#function mergesort(x, coordinate)
 #   p = 1
  #  r = lenght(x[:, coordinate])

   # if p < r

    #end
#end


function testfunction(coordinate)
    test_array1 = [1 2; 4 6; 2 1;3 4;5 6;1 8]
    test_array2 = [3 5; 2 1; 4 3]
    x = [1 2;2 1;3 4]
    y = [2 2;4 1;5 6]
    test_mergearrays = mergearrays(x, y, coordinate)
    return test_mergearrays
    
end

testfunction(1)
