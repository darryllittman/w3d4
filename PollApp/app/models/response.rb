class Response < ActiveRecord::Base
  validate :not_duplicate_response
  validate :author_cannot_answer_their_poll

  belongs_to(
    :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
)
  belongs_to(
    :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice
)

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  def sibling_responses
    # self.question.responses
    return self.question.responses if self.id.nil?
    self.question.responses.where("responses.id != ?", self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def not_duplicate_response
    if respondent_already_answered?
      self.errors[:user_id] << "duplicate response"
    end
  end

  def author_cannot_answer_their_poll
    if self.user_id == answer_choice.question.poll.author_id
      self.errors[:user_id] << "You should not answer your own questions!"
    end
  end
end
