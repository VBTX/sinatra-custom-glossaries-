



User.create(name: "Victoria", email: "victoria@gmail.com", password: "password")
User.create(name: "Drew", email: "drew@gmail.com", password: "password")
Glossary.create(title: "medical", user_id: 1)
Glossary.create(title: "legal", user_id: 2)
Entry.create(word: "something", definition: "anything", notes: "blah", link: "greatweb", glossary_id: 1)
Entry.create(word: "nothing", definition: "everything", notes: "blows my mind", link: "greatwebagain", glossary_id: 2)

