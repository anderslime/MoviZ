require "rupy"


# start the Python VM
Rupy.start_from_virtualenv("/path/to/virtualenv")
# Rupy.start(:python => "/path/to/virtualenv/bin/python")
# Rupy.start 

nx = Rupy.import("networkx")

graph = nx.Graph()
graph.add_node("spam")
graph.add_edge(1,2)
puts G.nodes()
puts G.edges()