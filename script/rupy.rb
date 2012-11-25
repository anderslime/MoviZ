require "rupy"

# start the Python VM
Rupy.start_from_virtualenv("./venv")
# Rupy.start(:python => "./venv/bin/python")
# Rupy.start

pythonscript = RubyPython.import('os')
pythonscript

puts "hey"
graph = nx.Graph()
# graph.add_node("Hey")
graph.add_edge(1,2)
# graph.add_node("spam")
# graph.add_edge(1,2)
# puts G.nodes()
# puts G.edges()

# Rupy.stop
