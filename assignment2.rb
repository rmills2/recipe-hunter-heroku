# encoding: utf-8
word_count = Hash.new(0)
domain_pattern = /@([a-z]+\.[a-z]+)/
File.open("assignment_two_text.txt", "r") do |file|
  file.each_line do |line|
    line.split.each do |word|
      word_count[word.match(domain_pattern)[1]] += 1 if word =~ /@/
    end
  end
end

word_count.each do |w|
  printf("%-10s: %s time(s)", w[0], w[1])
  printf("\n")
end