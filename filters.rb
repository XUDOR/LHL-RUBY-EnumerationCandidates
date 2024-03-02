require 'date' # Ensure you have this require at the top if you're using Date

def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

def find(id)
  @candidates.find { |candidate| candidate[:id] == id }
end

def qualified_candidates(candidates)
  candidates.select do |candidate|
    experienced?(candidate) &&
    candidate[:github_points] >= 100 &&
    (candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')) &&
    (Date.today - candidate[:date_applied]).to_i <= 15 &&
    candidate[:age] > 17
  end
end

def ordered_by_qualifications(candidates)
  candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end
