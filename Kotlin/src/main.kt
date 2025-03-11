// Step 1 - define a _data class_ called Node to represent a location
data class Node(
    val name: String,
    var Xcor: Double,
    var Ycor: Double
)

// Step 2 - listNodes - returns a list of Node objects
fun listNodes(): List<Node>{
    // list of nodes
    val nodeLocations: MutableList<Node> = mutableListOf()

    nodeLocations.add(Node("Eggs", 45.5, 95.7))
    nodeLocations.add(Node("Milk", 53.83, 90.62))
    nodeLocations.add(Node("Butter", 40.82, 85.76))
    nodeLocations.add(Node("Corn", 33.56, 55.03))
    nodeLocations.add(Node("Yogurt", 45.46, 93.75))

    return nodeLocations
}

// Step 3 - distanceFromEggs(Node) - calculate how far a given node is from Egg node
fun distanceFromEggs(node: Node): Double{
    val eggs = Node("Eggs", 45.5, 95.7)
    val aSquared = Math.pow(eggs.Ycor - node.Ycor, 2.0)
    val bSquared = Math.pow(eggs.Xcor - node.Xcor, 2.0)
    val distance = Math.sqrt(aSquared + bSquared)
    return distance
}

fun main(){
    // Step 2 - call listNodes()
    println("********Step Two********")
    val nodeLocations = listNodes()
    for(node in nodeLocations){
        println(node)
    }

    // Step 3 - call distanceFromEggs() on butter and print the result
    val butterFromEggs = distanceFromEggs(nodeLocations[2])
    println("********Step Three********")
    println("The distance between Eggs and Butter is ${butterFromEggs} cordinates")

    // Step 4 - call map() of nodeLocations with distanceFromEggs(node) to get list distance of all nodes from Eggs
    val nodesFromEggs = nodeLocations.map { distanceFromEggs(it) }
    println("********Step Four********")
    println("A new list with the distances of all Nodes in list to Eggs:")
    println(nodesFromEggs)

    // Step 5 - call filter() method of nodeLocations list passing _anonymous function_ that returns
    // true if a Node is "far" from Eggs (further than 2)
    val farNodes = fun(node: Node): Boolean{
        return distanceFromEggs(node) > 2
    }
    val farNodesList = nodeLocations.filter(farNodes)
    println("********Step Five********")
    println("List of Nodes over 2 coordinates from Eggs")
    for(node in farNodesList){
        println(node.name)
    }

    // Step 6 - use map() and filter() to get list of names of Nodes that are in the "West"
    // Meaning west of Xcor 45.3 or greater than Xcor 45.3 - implimented using lambda functions
    val nodesWest: (Node) -> Boolean = {it -> it.Xcor > 45.3}
    val westNodes = nodeLocations.filter(nodesWest)
    val getNames: (Node) -> String = {it -> it.name}
    val westNodesNames = westNodes.map {getNames(it)}
    println("********Step Six********")
    println("List of Node names that are in the 'West'")
    println(westNodesNames)

    // Step 7 - find what Node is furthest from Eggs using maxBy()
    println("********Step Seven********")
    println("Max Distance: ${nodeLocations.maxBy { distanceFromEggs(it) }}")

    // Step 8 - use map() to create Map<String, Node> object where each key is the
    // name of a Node and the value is the Node object
    val mappedNodes: Map<String, Node> = nodeLocations.associateBy(getNames)
    println("********Step Eight********")
    println("Printing mapped nodes:")
    for(node in mappedNodes){
        println("Name ${node.key}: ${node.value}")
    }
    println("Using mappedNodes to print the Xcor of Eggs:")
    val eggsNode = mappedNodes["Eggs"]
    eggsNode?.let {
        println("Xcor of Eggs: ${it.Xcor}")
    } ?: run {
        println("Eggs node not found.")
    }
}