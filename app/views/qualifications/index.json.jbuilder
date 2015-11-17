json.array!(@qualifications) do |qualification|
  json.extract! qualification, :id, :employee_id, :ssc, :ssc_from, :ssc_marks, :ssc_year, :ssc_bord, :deploma, :deploma_from, :deploma_marks, :deploma_year, :deploma_university, :hsc, :hsc_from, :hsc_marks, :hsc_year, :hsc_bord, :ug, :ug_from, :ug_marks, :ug_year, :ug_university, :pg, :pg_from, :pg_marks, :pg_yaer, :pg_university
  json.url qualification_url(qualification, format: :json)
end
