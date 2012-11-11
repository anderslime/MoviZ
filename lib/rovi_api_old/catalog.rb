module RoviApi
  class Catalog < Struct.new(:objects)

    def find_or_create_by_id(sig, object_input)
      object = find_by_id(object_input.id)
      if !object.present?
        object = Service.create_movie_by_id(sig, self, object_input.id)
        objects << object
      end
      object
    end

    def find_by_id(id)
      objects.find {|object| object.id == id}
    end
  end
end
