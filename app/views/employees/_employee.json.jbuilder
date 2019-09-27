json.extract! employee, :id, :born, :sex, :email, :created_at, :updated_at
json.url employee_url(employee, format: :json)
