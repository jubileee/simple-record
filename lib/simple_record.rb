require "simple_record/version"
require "json"

module SimpleRecord

  class Entity

    class << self
      attr_accessor :path 
    end

    def self.new(record)
      super(record)
    end

    def self.all 
      file = File.open(@path)
      data = file.read
      file.close
      objects = []
      data.split("\n").each {|j| objects << new(JSON.parse(j))}
      objects
    end

    def self.find(id)
      file = File.open(@path)
      data = file.read
      file.close
      data.split("\n").each do |record|
        record = JSON.parse(record)
        if record["id"] == id
          return new(record)
        end
      end
    end

  end

end
