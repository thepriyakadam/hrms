json.extract! reimbursement_slab, :id, :reimbursement_head_id, :employee_grade_id, :employee_designation_id, :from, :to, :monthly_amount, :yearly_amount, :status, :created_at, :updated_at
json.url reimbursement_slab_url(reimbursement_slab, format: :json)
