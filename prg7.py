print("devadharshini")
print("Breadth First Search program")
from collections import defaultdict
def bfs(graph, start):
    visited = set()
    queue = [start]
    visited.add(start)

    while queue:
        node = queue.pop(0)
        print(node, end=" ")

        for neighbor in graph[node]:
            if neighbor not in visited:
                queue.append(neighbor)
                visited.add(neighbor)
if __name__ == "__main__":
    
    graph = defaultdict(list)
    graph[0] = [2, 4]
    graph[1] = [4]
    graph[2] = [1, 3]
    graph[3] = [3]

    print("BFS traversal:")
    bfs(graph, 2)
