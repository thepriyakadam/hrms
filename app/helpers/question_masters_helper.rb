module QuestionMastersHelper
  def all_question_master
    QuestionMaster.all.collect { |x| [x.name, x.id] }
  end
end
