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

  def candidate_picture(number)
    case number
      when 1
        "https://cdn.rawgit.com/michaelgrotton/cssStuff/1fd3a1b3/Dem1.jpg"
      when 2
        "https://cdn.rawgit.com/michaelgrotton/cssStuff/1fd3a1b3/Dem2.jpg"
      when 3
        "https://cdn.rawgit.com/michaelgrotton/cssStuff/1fd3a1b3/Rep1.jpg"
      when 4
        "https://cdn.rawgit.com/michaelgrotton/cssStuff/1fd3a1b3/Dem1.jpg"
    end
  end
end
