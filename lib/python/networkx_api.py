import networkx as nx

def test():
  g = nx.Graph()
  g.add_edge(1,2)
  print g.nodes()
