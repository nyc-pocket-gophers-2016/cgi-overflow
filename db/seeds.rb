
users = [
  {first_name: 'Gregor',
   username: 'gregor',
   email: 'gregor@gregor.com'
   password: 'gregor'},

  {first_name: 'Calvin',
   username: 'calvin',
   email: 'calvin@calvin.com'
   password: 'calvin'},

  {first_name: 'Ilya',
   username: 'ilya',
   email: 'ilya@ilya.com'
   password: 'ilya'}
]

questions=[
  {title: "how do I make a lot of money?",
  user_id: 1
  question: "I was wondering if I should get a job or maybe I should just start a business. Help me decide"},
  {title: "why are ruby coders in demand?",
  question: "I have heard that ruby sucks but I keep seeing ruby jobs online. What's up with that?"
  user_id: 3},
  {title: "what is the point of life?"
  question: "I'm trying to figure it out so I can make sure to get into heaven. I just want to know what its all for."
  user_id: 2}
]


User.create(users)
Question.create(questions)

