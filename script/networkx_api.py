import networkx as nx

G=nx.Graph()
G.add_node("spam")
G.add_edge(1,2)


def test():
  print(G.nodes())
  print(G.edges())