module FrequestQuestionsHelper

   def all_frequest_question
    FrequestQuestion.where(status: true).collect { |x| [x.name, x.id] }
  end
end
