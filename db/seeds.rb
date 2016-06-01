users = [
  {first_name: 'Gregor',
   username: 'gregor',
   email: 'gregor@gregor.com',
   password: 'gregor'},

  {first_name: 'Calvin',
   username: 'calvin',
   email: 'calvin@calvin.com',
   password: 'calvin'},

  {first_name: 'Ilya',
   username: 'ilya',
   email: 'ilya@ilya.com',
   password: 'ilya'}
]

questions=[
  {title: "how do I make a lot of money?",
  user_id: 1,
  question: "I was wondering if I should get a job or maybe I should just start a business. Help me decide"},
  {title: "why are ruby coders in demand?",
  question: "I have heard that ruby sucks but I keep seeing ruby jobs online. What's up with that?",
  user_id: 3},
  {title: "what is the point of life?",
  question: "I'm trying to figure it out so I can make sure to get into heaven. I just want to know what its all for.",
  user_id: 2}
]

answers = [
  {answer: "Bubbles",
   best_answer: true,
   user_id: 1,
   question_id: 1},

  {answer: "Blossom",
   best_answer: false,
   user_id: 1,
   question_id: 1},

  {answer: "Buttercup",
   best_answer: false,
   user_id: 1,
   question_id: 1},

  {answer: "Sun",
   best_answer: false,
   user_id: 2,
   question_id: 2},

  {answer: "Moon",
   best_answer: false,
   user_id: 2,
   question_id: 2},

  {answer: "Earth",
   best_answer: true,
   user_id: 2,
   question_id: 2},

  {answer: "Zeus",
   best_answer: false,
   user_id: 3,
   question_id: 3},

  {answer: "Ares",
   best_answer: false,
   user_id: 3,
   question_id: 3},

  {answer: "Atlas",
   best_answer: true,
   user_id: 3,
   question_id: 3}
]

comments = [
  {comment: "Totally!",
  commentable_id: 1,
  commentable_type: "question",
  user_id: 2},

  {comment: "This answer helped me, thanks!",
  commentable_id: 3,
  commentable_type: "answer",
  user_id: 1},

  {comment: "That's so dumb",
  commentable_id: 2,
  commentable_type: "question",
  user_id: 3},

  {comment: "Ok then",
  commentable_id: 1,
  commentable_type: "answer",
  user_id: 2},

  {comment: "yeah right!",
  commentable_id: 3,
  commentable_type: "question",
  user_id: 2},

  {comment: "yeah buddy!",
  commentable_id: 3,
  commentable_type: "question",
  user_id: 2},

  {comment: "This answer didn't help me :(",
  commentable_id: 2,
  commentable_type: "answer",
  user_id: 2},

  {comment: "That's so awesome",
  commentable_id: 3,
  commentable_type: "question",
  user_id: 1}
]

votes = [
  {vote_value: 1,
  votable_id: 2,
  votable_type: "question",
  user_id: 3},
  {vote_value: 3,
  votable_id: 2,
  votable_type: "answer",
  user_id: 1},
  {vote_value: 2,
  votable_id: 3,
  votable_type: "answer",
  user_id: 1},
  {vote_value: 2,
  votable_id: 3,
  votable_type: "comment",
  user_id: 3},
  {vote_value: 1,
  votable_id: 2,
  votable_type: "question",
  user_id: 2},
  {vote_value: 3,
  votable_id: 3,
  votable_type: "question",
  user_id: 1},
  {vote_value: 2,
  votable_id: 1,
  votable_type: "answer",
  user_id: 1},
  {vote_value: 3,
  votable_id: 3,
  votable_type: "comment",
  user_id: 2},
  {vote_value: 1,
  votable_id: 1,
  votable_type: "answer",
  user_id: 1}
]


User.create!(users)
Question.create(questions)
Answer.create!(answers)
# Comment.create(comments)
# Vote.create(votes)
