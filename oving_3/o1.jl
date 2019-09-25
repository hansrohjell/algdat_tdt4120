
#takk til Helge Bergo for masse bistand

function mergearrays(x,y,coordinate)
    n1 = length(x[:,coordinate])
    n2 = length(y[:,coordinate])
    n_tot = n1 + n2
    lhs = [x; Inf Inf]
    rhs = [y; Inf Inf]
    x_index = 1
    y_index = 1
    m_array = [zeros(Int64, n_tot) zeros(Int64, n_tot)]

    for i in 1:n_tot
       if lhs[x_index,coordinate] <= rhs[y_index,coordinate]
           m_array[i,:] = lhs[x_index,:]
           #push!(m_array, rhs[y_index, :])
           x_index += 1
        else
            m_array[i,:] = rhs[y_index, :] 
        #   push!(m_array, lhs[x_index, :])
            y_index += 1
        end
    end
    return m_array
end



function mergesort(x, coordinate)
    p = 1
    r = length(x[:,coordinate])
    #println(r)
    if p < r
        q = Int(fld(p+r,2))
        lhs = mergesort(x[p:q, :], coordinate)
        rhs = mergesort(x[q+1:r, :], coordinate)
        x = mergearrays(lhs, rhs, coordinate)
    end
    return x
end

    

    

### Tests ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere! 

printstyled("\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
println("Kjører testene for mergeararys!")
@testset "Basic tests for mergeararys" begin
    @test mergearrays([1 0; 3 0], [2 0; 4 0], 1) == [1 0; 2 0; 3 0; 4 0]
    @test mergearrays([1 0; 4 0], [2 0; 3 0], 1) == [1 0; 2 0; 3 0; 4 0]
end

println("\n--------------------------------------------\n")

println("Kjører testene for mergesort!")
println("Husk at om du gir et array med float, any, eller int, gjør det ikke noe.\n")
@testset "Basic tests for mergesort" begin
    @test mergesort([4 0; 3 0; 1 0; 2 0],1) == [1 0; 2 0; 3 0; 4 0]
    @test mergesort([1 2; 4 6; 2 1],1) == [1 2; 2 1; 4 6]
    @test mergesort([1 2; 4 6; 2 1],2) == [2 1; 1 2; 4 6]
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n\n\n\n")
