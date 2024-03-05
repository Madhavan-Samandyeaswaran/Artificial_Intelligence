class Graph:
    def __init__(self):
        self.graph = {}

    def add_edge(self, node, neighbors):
        self.graph[node] = neighbors

def dfs(graph, start, visited):
    if start not in visited:
        print(start, end=' ')
        visited.add(start)

        if start in graph:
            for neighbor in graph[start]:
                dfs(graph, neighbor, visited)

if __name__ == "__main__":
    user_graph = Graph()

    while True:
        node_str = input("Enter a node (or 'done' to finish): ")
        if node_str.lower() == 'done':
            break

        try:
            node = int(node_str)
        except ValueError:
            print("Invalid input. Please enter an integer.")
            continue

        neighbors_str = input(f"Enter neighbors for node {node} separated by spaces: ")
        neighbors = [int(neighbor) for neighbor in neighbors_str.split()]

        user_graph.add_edge(node, neighbors)

    start_node = int(input("Enter the starting node for DFS: "))

    visited_nodes = set()
    print(f"DFS traversal starting from node {start_node}:")
    dfs(user_graph.graph, start_node, visited_nodes)
