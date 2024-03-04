# Tic-Tac-Toe board representation
EMPTY = '-'
PLAYER_X = 'X'
PLAYER_O = 'O'

def print_board(board):
    for row in board:
        print(" ".join(row))
    print()

def is_winner(board, player):
    # Check rows, columns, and diagonals
    for i in range(3):
        if all(cell == player for cell in board[i]) or all(board[j][i] == player for j in range(3)):
            return True
    if all(board[i][i] == player for i in range(3)) or all(board[i][2 - i] == player for i in range(3)):
        return True
    return False

def is_board_full(board):
    return all(cell != EMPTY for row in board for cell in row)

def evaluate(board):
    if is_winner(board, PLAYER_X):
        return 1
    elif is_winner(board, PLAYER_O):
        return -1
    elif is_board_full(board):
        return 0
    else:
        return None

def minimax(board, depth, maximizing_player):
    score = evaluate(board)

    if score is not None:
        return score

    if maximizing_player:
        max_eval = float('-inf')
        for i in range(3):
            for j in range(3):
                if board[i][j] == EMPTY:
                    board[i][j] = PLAYER_X
                    eval = minimax(board, depth + 1, False)
                    board[i][j] = EMPTY
                    max_eval = max(max_eval, eval)
        return max_eval

    else:
        min_eval = float('inf')
        for i in range(3):
            for j in range(3):
                if board[i][j] == EMPTY:
                    board[i][j] = PLAYER_O
                    eval = minimax(board, depth + 1, True)
                    board[i][j] = EMPTY
                    min_eval = min(min_eval, eval)
        return min_eval

def best_move(board):
    best_val = float('-inf')
    best_move = None

    for i in range(3):
        for j in range(3):
            if board[i][j] == EMPTY:
                board[i][j] = PLAYER_X
                move_val = minimax(board, 0, False)
                board[i][j] = EMPTY

                if move_val > best_val:
                    best_move = (i, j)
                    best_val = move_val

    return best_move

def play_game():
    board = [[EMPTY] * 3 for _ in range(3)]

    while True:
        print_board(board)

        # Player's move
        row, col = map(int, input("Enter your move (row and column, separated by space): ").split())
        if board[row][col] == EMPTY:
            board[row][col] = PLAYER_O
        else:
            print("Invalid move. Try again.")
            continue

        # Check for player win or a draw
        if is_winner(board, PLAYER_O):
            print("Congratulations! You win!")
            break
        elif is_board_full(board):
            print("It's a draw!")
            break

        # AI's move
        print("AI's move:")
        ai_row, ai_col = best_move(board)
        board[ai_row][ai_col] = PLAYER_X

        # Check for AI win or a draw
        if is_winner(board, PLAYER_X):
            print("AI wins! Better luck next time.")
            break
        elif is_board_full(board):
            print("It's a draw!")
            break

if __name__ == "__main__":
    play_game()
