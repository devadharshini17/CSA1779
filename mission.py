def is_valid_state(m, c):
    if m < 0 or m > 3 or c < 0 or c > 3:
        return False
    if (m < c and m > 0) or (3 - m < 3 - c and 3 - m > 0):
        return False
    return True

def solve_missionaries_cannibals(m, c):
    visited = set()
    stack = [(m, c, 0, 0, [])]

    while stack:
        m_left, c_left, m_right, c_right, path = stack.pop()

        if m_left == 0 and c_left == 0:
            return path

        if (m_left, c_left) in visited:
            continue

        visited.add((m_left, c_left))

        for move_m, move_c in [(1, 0), (2, 0), (0, 1), (0, 2), (1, 1)]:
            new_m_left = m_left - move_m
            new_c_left = c_left - move_c
            new_m_right = m_right + move_m
            new_c_right = c_right + move_c

            if is_valid_state(new_m_left, new_c_left) and is_valid_state(new_m_right, new_c_right):
                new_path = path + [(move_m, move_c)]
                stack.append((new_m_left, new_c_left, new_m_right, new_c_right, new_path))

    return None

def main():
    m = int(input("Enter the number of missionaries on the left side: "))
    c = int(input("Enter the number of cannibals on the left side: "))

    path = solve_missionaries_cannibals(m, c)

    if path is None:
        print("No solution found.")
    else:
        print("Steps to solve:")
        for move_m, move_c in path:
            print(f"Move {move_m} missionaries and {move_c} cannibals to the other side.")

if __name__ == "__main__":
    main()
