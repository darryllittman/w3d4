# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!([{name: "Bob"}, {name: "Fred"}, {name: "John"}])
Poll.create!([{title: "What's your name?", author_id: User.first.id},
              {title: "What's your favorite color?", author_id: User.find_by(name: "John").id}])
Question.create!([{body: "Is that really your name?", poll_id: Poll.first.id},
                  {body: "Seriously though?", poll_id: Poll.first.id},
                  {body: "Are you colorblind?", poll_id: Poll.all[1].id},
                  {body: "So I'll put down grey?", poll_id: Poll.all[1].id}])
AnswerChoice.create!([{question_id: Question.first.id, answer_body: "yes"},
                      {question_id: Question.first.id, answer_body: "no"},
                      {question_id: Question.all[1].id, answer_body: "I am serious"},
                      {question_id: Question.all[1].id, answer_body: "I am not serious"},
                      {question_id: Question.all[2].id, answer_body: "I am colorblind"},
                      {question_id: Question.all[2].id, answer_body: "I am not colorblind"},
                      {question_id: Question.all[3].id, answer_body: "that's fine"},
                      {question_id: Question.all[3].id, answer_body: "blue's nice"}])
Response.create!([{user_id: User.last.id, answer_choice_id: AnswerChoice.all[0].id},
                  {user_id: User.last.id, answer_choice_id: AnswerChoice.all[2].id},
                  {user_id: User.last.id, answer_choice_id: AnswerChoice.all[4].id},
                  {user_id: User.last.id, answer_choice_id: AnswerChoice.all[6].id},
                  {user_id: User.all[1].id, answer_choice_id: AnswerChoice.all[0].id},
                  {user_id: User.all[1].id, answer_choice_id: AnswerChoice.all[2].id},
                  {user_id: User.all[1].id, answer_choice_id: AnswerChoice.all[4].id},
                  {user_id: User.all[1].id, answer_choice_id: AnswerChoice.all[6].id},
                  {user_id: User.all[0].id, answer_choice_id: AnswerChoice.all[1].id},
                  {user_id: User.all[0].id, answer_choice_id: AnswerChoice.all[3].id},
                  {user_id: User.all[0].id, answer_choice_id: AnswerChoice.all[5].id},
                  {user_id: User.all[0].id, answer_choice_id: AnswerChoice.all[7].id}])
