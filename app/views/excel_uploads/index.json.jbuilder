json.array!(@excel_uploads) do |excel_upload|
  json.extract! excel_upload, :id, :code, :file_name, :size
  json.url excel_upload_url(excel_upload, format: :json)
end
