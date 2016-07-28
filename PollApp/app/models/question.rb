class Question < ActiveRecord::Base

  belongs_to(
    :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll
)
  has_many(
    :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice
)
  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
)

  # def results
  #   answer_choices = self.answer_choices.includes(:responses)
  #   results_hash = {}
  #   answer_choices.each do |answer_choice|
  #     results_hash[answer_choice.answer_body] = answer_choice.responses.length
  #   end
  #
  #   results_hash
  # end

  def results
    SELECT answer_choices.*, COUNT(responses.id)
    FROM answer_choices
    LEFT OUTER JOIN responses
      ON responses.answer_choice_id = answer_choices.id
    WHERE
      self.id = answer_choices.question_id
    GROUP BY
      answer_choices.id

  end
end
