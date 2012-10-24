#!/usr/bin/env ruby

require 'activesupport/core_ext'

batches = Dir.entries("#{Dir.home}/Code").in_groups_of(4)

batches.each do |batch|
  Thread.new do
    batch.each do |dirname|
      fulldir = "#{Dir.home}/Code/#{dirname}"
      if Dir.directory?("#{Dir.home}/Code/#{dirname}")
        puts "Updating: #{dirname}"
        `cd #{fulldir}; git pull`
      end
    end
  end
end
