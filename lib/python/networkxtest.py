import networkx as nx

def edges_to_graph(edges):
  G = nx.Graph()
  G.add_edges_from(edges)
  return G

def cluster_coefficient(graph):
  return nx.clustering(graph)
