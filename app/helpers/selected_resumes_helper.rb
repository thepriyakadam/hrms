module SelectedResumesHelper
  def all_candidate_name
      SelectedResume.where(is_confirm: true).collect { |x| [x.name] }
  end

  def all_candidate_name
      SelectedResume.where(is_confirm: true).collect { |x| [x.name] }
  end
end
