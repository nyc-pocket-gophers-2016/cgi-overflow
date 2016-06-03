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
  {title: "how does AJAX work?",
  user_id: 1,
  question: "We are working on a project and I would like to use Ajax, who can explain to me how it works?"},

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

User.create(users)
Question.create(questions)
Answer.create(answers)
