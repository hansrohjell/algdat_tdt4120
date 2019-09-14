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


helge har liten tiss 


function findindexinlist(linkedlist, index)
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




function testfunction(numberoftests, length, index)
    for i in 1:numberoftests
        testlist = createlinkedlist(length)
        answer = findindexinlist(testlist,index)
        if answer == -1
            println("Index larger than list")
        else
            println("Index ",index, " = " ,answer)
            println(testlist)
        end
    end
end


println(testfunction(1,10,4))