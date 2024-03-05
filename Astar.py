import heapq

class Node:
    def __init__(self, position, cost, heuristic):
        self.position = position
        self.cost = cost
        self.heuristic = heuristic

    def __lt__(self, other):
        return (self.cost + self.heuristic) < (other.cost + other.heuristic)

def heuristic_estimate(current, goal):
    return abs(goal[0] - current[0]) + abs(goal[1] - current[1])

def a_star_algorithm(start, goal, obstacles):
    directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]  # Up, Down, Right, Left

    start_node = Node(start, 0, heuristic_estimate(start, goal))
    priority_queue = [start_node]
    visited = set()

    while priority_queue:
        current_node = heapq.heappop(priority_queue)

        if current_node.position == goal:
            return current_node.cost  # Goal reached

        if current_node.position in visited:
            continue

        visited.add(current_node.position)

        for direction in directions:
            new_position = (current_node.position[0] + direction[0], current_node.position[1] + direction[1])

            if new_position[0] < 0 or new_position[0] >= 10 or new_position[1] < 0 or new_position[1] >= 10:
                continue  # Skip if out of bounds

            if new_position in obstacles:
                continue  # Skip if the new position is an obstacle

            new_cost = current_node.cost + 1
            new_heuristic = heuristic_estimate(new_position, goal)
            new_node = Node(new_position, new_cost, new_heuristic)

            if new_position not in visited:
                heapq.heappush(priority_queue, new_node)

    return None  # No path found

def get_user_input():
    start = tuple(map(int, input("Enter the starting position (x y): ").split()))
    goal = tuple(map(int, input("Enter the goal position (x y): ").split()))

    obstacle_count = int(input("Enter the number of obstacles: "))
    obstacles = [tuple(map(int, input(f"Enter obstacle {i + 1} position (x y): ").split())) for i in range(obstacle_count)]

    return start, goal, obstacles

if __name__ == "__main__":
    start_position, goal_position, obstacle_positions = get_user_input()

    path_cost = a_star_algorithm(start_position, goal_position, obstacle_positions)

    if path_cost is not None:
        print(f"The shortest path from {start_position} to {goal_position} is found with cost: {path_cost}")
    else:
        print("No path found.")
