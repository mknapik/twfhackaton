module Levenshtein
  class << self
    def distance(seq1, seq2)
      costs = Array(0..seq2.length) # i == 0
      (1..seq1.length).each do |i|
        process_first_seq(costs, i, seq1, seq2)
      end
      costs[seq2.length]
    end

    private

    def process_first_seq(costs, i, seq1, seq2)
      costs[0] = i
      nw = i - 1
      (1..seq2.length).each do |j|
        new_costs = [costs[j] + 1, costs[j - 1] + 1, compared_cost(i, j, nw, seq1, seq2)].min
        costs[j], nw = new_costs, costs[j]
      end
    end

    def compared_cost(i, j, nw, seq1, seq2)
      seq1[i - 1] == seq2[j - 1] ? nw : nw + 1
    end
  end
end
