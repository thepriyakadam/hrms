json.array!(@employee_resignations) do |employee_resignation|
  json.extract! employee_resignation, :id, :employee_id, :resignation_date, :reason, :is_notice_period, :notice_period, :short_notice_period, :tentative_leaving_date, :remark, :exit_interview_date, :note, :leaving_date, :settled_on, :has_left, :notice_served, :rehired
  json.url employee_resignation_url(employee_resignation, format: :json)
end
