#!/usr/bin/env ruby

require 'active_support/core_ext'
puts 'Starting...'

batches = Dir.entries("#{Dir.home}/Code").in_groups_of(4)
threads = []

batches.each do |batch|
  threads << Thread.new do
    batch.each do |dirname|
      fulldir = "#{Dir.home}/Code/#{dirname}"
      if File.directory?(fulldir) && File.directory?("#{fulldir}/.git")
        puts "Updating: #{dirname}"
        `cd #{fulldir}; git pull`
      end
    end
  end
end

threads.map(&:join)
