#Anta at closestpair får inn to arrays, hvor x er sortert på x-akse
#og y er sortert med hensyn på y-aksen.

function closestpair(x,y)

end

#Sørger for at closespair mottar sorterte arrays
#La stå, denne kalles for å teste koden
function callclosestpair(arr)
    x = mergesort(arr,1)
    y = mergesort(arr,2)
    return closestpair(x,y)
end