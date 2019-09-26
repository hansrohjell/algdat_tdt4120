#Bruteforce: Regne ut alle avstandene for å finne den minste avstand mellom to punkter
function bruteforce(x)
    min_lengde = 10000

    for i in 1:size(x,1)
        for j in 2:size(x,1)
            x_d = x[i, 1] - x[j, 1]
            y_d = x[i, 2] - x[j, 2]
            
            lengde = sqrt(x_d^2 + y_d^2)
            @show lengde
            if lengde < min_lengde && lengde > 0
                min_lengde = lengde
            end
        end
    end
    @show min_lengde
    return min_lengde

end




x = [1 1; 10 0; 2 2; 5 5]

bruteforce(x)
#Skal gi 1.414..