json.extract! response, :id, :subjnum, :dyad, :whichtest, :condition, :date, :photo, :code, :response, :judgement, :coder, :created_at, :updated_at
json.url response_url(response, format: :json)
