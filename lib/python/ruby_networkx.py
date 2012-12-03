import networkx as nx
import community as com

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

def communities(graph):
  best_partition = com.best_partition(graph)
  return list_communities(best_partition)

def list_communities(part):
  communities = {}
  print max(part.values())
  for ci in range(0,max(part.values()) + 1):
    communities[ci] = []

  for char in part.keys():
    communities[part[char]].append(char)
  return communities.values()

def to_sorted_array(a_hash):
  return sorted(a_hash.items(), key=lambda x: x[1], reverse=True)
