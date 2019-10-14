### Du skal implementere denne funksjonen ###
function cumulative(weights)
    rows, cols = size(weights)
    pathweights = zeros(rows, cols)

    for i = 1:cols
        pathweights[1, i] = weights[1, i]
    end
    for i = 1:rows-1
        for j = 1:cols
            k = weights[i, j]
            
            if j == 1
                pathweights[i,j] = min(pathweights[i-1,j] + k,pathweights[i-1,j+1] + k)
            elseif j == cols
                pathweights[i,j] = min(pathweights[i-1,j] + k,pathweights[i-1,j-1]+ k)
            else
                pathweights[i,j] = min(pathweights[i-1,j + k,pathweights[i-1,j-1]+ k,pathweights[i-1,j+1]+ k)
            end
        end
        
    end
    return pathweights
end
# Dette gir deg dimensjonene til en matrise
#rows, cols = size(matrix)


# For å aksessere et element
#element = matrix[i,j]



### Tester ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test cumulative([1 1 ; 1 1]) == [1 1 ;2 2]
    #Dette er samme eksempel som det vist i oppgaveteskten
	@test cumulative([3  6  8 6 3; 7  6  5 7 3; 4  10 4 1 6; 10 4  3 1 2;6  1  7 3 9])== [3  6  8  6  3;10 9  11 10 6;13 19 13 7  12;23 17 10 8  9;23 11 15 11 17]
end


println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")