json.array!(@joining_details) do |joining_detail|
  json.extract! joining_detail, :id, :employee_id, :joining_date, :reffernce_from, :admin_hr, :tech_hr, :designation, :ctc, :account_no, :employee_grade_id, :confirmation_date, :status, :probation_period, :notice_period, :medical_schem
  json.url joining_detail_url(joining_detail, format: :json)
end
