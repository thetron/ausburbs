require 'bundler'
Bundler::GemHelper.install_tasks

namespace :data do
  task :map do
    puts "Mapping data"

    states = {}

    f = File.open 'data/au_pc_ll.csv'
    f.readline
    f.lines.each_with_index do |line, index|
      data = line.split(",").map{ |d| d.gsub(/"/, '') }
      suburb = {}
      suburb[:postcode] = data[0].to_s
      suburb[:name] = data[1].to_s
      suburb[:state] = data[2].to_s
      suburb[:latitude] = data[5].to_f
      suburb[:longitude] = data[6].to_f

      states[suburb[:state]] ||= []
      states[suburb[:state]] << suburb if !suburb[:name].nil? && suburb[:name] != ""
    end

    File.open('data/suburbs.yml', 'w'){|f| f.write(states.to_yaml)}
  end
end
