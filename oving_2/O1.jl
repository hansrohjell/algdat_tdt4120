mutable struct Node
    next::Union{Node, Nothing} # next kan peke på et Node-objekt eller ha verdien nothing.
    value::Int
end

function createlinkedlist(length)
    # Creates the list starting from the last element
    # This is done so the last element we generate is the head
    child = nothing
    node = nothing

    values = []
    for i in 1:length
        node = Node(child, rand(1:800))
        child = node
        push!(values, node.value)
    end
    
    # Need to reverse since it started on the last value. 
    values = reverse(values) 
    println("values: ", values)

    return node
end



#Funker foreløpig ikke i øvingssystemet

function findindexinlist1(linkedlist, index)
    node = linkedlist
    i = 1
    if index == 1
        return node.value
    elseif index != 1
        while node.next != nothing
            node = node.next
            i += 1
            if i == index
                break
            end
        end
        return node.value
    end
end

helge har liten tiss

#Prøver med for-løkke
#fungerer nu

function findindexinlist2(linkedlist, index)
    node = linkedlist
    for i in 1:index
        if i == index
            return node.value
        elseif node.next == nothing
            return -1
        else 
            node = node.next
        end
    end
end



function testfunction(numberoftests, length, index)
    for i in 1:numberoftests
        testlist = createlinkedlist(length)
        answer = findindexinlist2(testlist,index)
        if answer == -1
            println("Index larger than list")
        else
            println("Index ",index, " = " ,answer)
            println(testlist)
        end
    end
end


println(testfunction(1,10,4))