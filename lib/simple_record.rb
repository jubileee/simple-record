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

    def self.create(params)
      File.open(@path, "a") do |f|
        f << params.to_json
        f << "\n"
      end
      last 
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

    def self.last
      self.all.last
    end

    def self.first
      self.all.first
    end

    def delete
      #TODO
    end

    def inspect
      first_part = super.split(" ").first.split(":").first + " "
      second_part = super.split(" ")[1..-1].join(" ").gsub!("@", "").gsub!("=", ": ")
      first_part + second_part
    end

  end

end
