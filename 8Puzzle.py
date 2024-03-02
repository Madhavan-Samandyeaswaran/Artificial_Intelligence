def print_board(board):
    for row in board:
        print(" ".join(str(cell) if cell != 0 else ' ' for cell in row))

def find_blank(board):
    for i, row in enumerate(board):
        for j, cell in enumerate(row):
            if cell == 0:
                return i, j

def is_valid_move(board, move):
    i, j = find_blank(board)
    return 0 <= i + move[0] < 3 and 0 <= j + move[1] < 3

def make_move(board, move):
    i, j = find_blank(board)
    new_board = [row.copy() for row in board]
    new_board[i][j], new_board[i + move[0]][j + move[1]] = new_board[i + move[0]][j + move[1]], new_board[i][j]
    return new_board

def is_goal(board):
    return board == [[1, 2, 3], [4, 5, 6], [7, 8, 0]]

def get_user_input():
    print("Enter the initial state of the 8-Puzzle (0 represents the blank space):")
    board = []
    for _ in range(3):
        row = [int(cell) for cell in input().split()]
        board.append(row)
    return board

def solve_puzzle(initial_board):
    moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]  # Up, Down, Left, Right

    queue = [(initial_board, [])]

    while queue:
        current_board, path = queue.pop(0)

        if is_goal(current_board):
            print("Solution found:")
            print("Initial State:")
            print_board(initial_board)
            print("\nSolution Steps:")
            for step in path:
                print_board(step)
                print()

            return

        for move in moves:
            if is_valid_move(current_board, move):
                new_board = make_move(current_board, move)
                queue.append((new_board, path + [new_board]))

    print("No solution found.")

if __name__ == "__main__":
    initial_state = get_user_input()
    solve_puzzle(initial_state)
