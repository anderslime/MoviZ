module NetworkGraphizer
  class Service < Struct.new(:objects, :levels)
    class << self
      def create_hash_network(objects, levels)
        new(objects, levels).create_hash_network
      end
    end

    def create_hash_network
      nodes = create_nodes
      edges = create_edges_from_related(nodes)
      Graph.new(nodes, edges)
    end

    def create_nodes
      nodes = []
      objects.each_with_index do |object, i|
        nodes << Node.new(i, object)
      end
      nodes
    end

    def create_edges_from_related(nodes)
      nodes.each do |node|
        node.object.related.each do |related_object_id|
          find_node_by_object_id(nodes, related_object_id)
        end
      end
    end

    def find_node_by_object_id(nodes, object_id)
      nodes.select {|node| node.object.id == object_id}.first
    end
  end
end
