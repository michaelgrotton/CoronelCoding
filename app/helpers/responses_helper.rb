module ResponsesHelper
  def judgement_string(number)
    case number
      when 1
        "The issue position written was one endorsed by this candidate"
      when 2
        "The issue position written was one endorsed by another candidate and that other candidate was the same party as this candidate"
      when 3
        "The issue position written was one endorsed by another candidate and that other candidate was the opposite party as this candidate"
      when 4
        "The issue position written was not endorsed by any of the 4 candidates and is a position that I would expect a politician of this candidate’s party to endorse"
      when 5
        "The issue position written was not endorsed by any of the 4 candidates and is a position that I would expect a politician of the opposite party as this candidate to endorse"
      when 6
        "Unknown/needs to be looked at"
      when 7
        "Does not seem to have finished typing"
    end
  end
end
