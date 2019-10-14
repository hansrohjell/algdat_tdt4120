function cumulative(weights)
    rows, cols = size(weights)
	result = zeros(rows, cols)

	for t = 1:cols
		result[1, t] = weights[1, t]
	end
	for i = 1:rows-1
		for j = 1:cols

			if j == 1 && cols >= 2	#leftmost column
				a = weights[i+1, j]
				b = weights[i+1, j+1]

				if result[i+1, j] == 0
					result[i+1, j] = result[i, j] + a
				else
					result[i+1, j] = min(result[i+1, j], result[i, j] + a)
				end

				if result[i+1, j+1] == 0
					result[i+1, j+1] = result[i, j] + b
				else
					result[i+1, j+1] = min(result[i+1, j+1], result[i, j] + b)
				end

			elseif j == cols && cols >=2 #Rightmost column
				a = weights[i+1, j-1]
				b = weights[i+1, j]

				if result[i+1, j-1] == 0
					result[i+1, j-1] = result[i, j] + a
				else
					result[i+1, j-1] = min(result[i+1, j-1], result[i, j] + a)
				end

				if result[i+1, j] == 0
					result[i+1, j] = result[i, j] + b
				else
					result[i+1, j] = min(result[i+1, j], result[i, j] +b)
				end
			else #middle part
				a = weights[i+1, j-1]
				b = weights[i+1, j]
				c = weights[i+1, j+1]

				if result[i+1, j-1] == 0
					result[i+1, j-1] = result[i, j] + a
				else
					result[i+1, j-1] = min(result[i+1, j-1], result[i, j] + a)
				end

				if result[i+1, j] == 0
					result[i+1, j] = result[i, j] + b
				else
					result[i+1, j] = min(result[i+1, j], result[i, j] +b)
				end

				if result[i+1, j+1] == 0
					result[i+1, j+1] = result[i, j] + c
				else
					result[i+1, j+1] = min(result[i+1, j+1], result[i, j] + c)
				end
			end
		end
	end
	return result

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