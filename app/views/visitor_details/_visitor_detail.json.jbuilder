json.extract! visitor_detail, :id, :name, :age, :contact_no, :email_id, :id_proof, :from, :meet_to_id, :in_time, :out_time, :purpose, :authorized_by_id, :created_at, :updated_at
json.url visitor_detail_url(visitor_detail, format: :json)