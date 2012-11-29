import networkx as nx

def edges_to_graph(edges):
  G = nx.Graph()
  G.add_edges_from(edges)
  return G

def clustering_coefficient(graph):
  return to_sorted_array(nx.clustering(graph))

def degree_centrality(graph):
  return to_sorted_array(nx.degree_centrality(graph))

def closeness_centrality(graph):
  return to_sorted_array(nx.closeness_centrality(graph))

def betweenness_centrality(graph):
  return to_sorted_array(nx.betweenness_centrality(graph))

def eigenvector_centrality(graph):
  return to_sorted_array(nx.eigenvector_centrality(graph))

def to_sorted_array(a_hash):
  return sorted(a_hash.items(), key=lambda x: x[1], reverse=True)
