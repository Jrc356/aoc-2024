def read_file(path)
  f = File.open(path)
  f.readlines.map(&:chomp)
end
