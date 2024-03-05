from queue import Queue

def bfs(graph, start_node):
    visited = set()
    queue = Queue()

    visited.add(start_node - 1)  # Adjusting for 0-based indexing
    queue.put(start_node - 1)

    while not queue.empty():
        current_node = queue.get()
        print(current_node + 1, end=' ')  # Adjusting for 1-based indexing in output

        for neighbor, is_connected in enumerate(graph[current_node]):
            if is_connected and neighbor not in visited:
                visited.add(neighbor)
                queue.put(neighbor)

if __name__ == "__main__":
    # Input the number of nodes in the graph
    num_nodes = int(input("Enter the number of nodes in the graph: "))

    # Input the adjacency matrix of the graph
    print("Enter the adjacency matrix (1 for connected, 0 for not connected):")
    graph = []
    for _ in range(num_nodes):
        row = [int(x) for x in input().split()]
        graph.append(row)

    # Input the starting node for BFS
    start_node = int(input("Enter the starting node for BFS: "))

    # Perform BFS and print the result
    print("BFS traversal starting from node", start_node, ":")
    bfs(graph, start_node)
