# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

o1 = Organization.create(name: "Snow", image:"",
                         rich_text: " ", description: "Hello members" )
o2 = Organization.create(name: "Autumn fall", image:"",
                         rich_text: " ", description: "Hello members, welcome everyone!!")

u1 = User.create( username: "user1", email: "kjara@miuandes.cl", password: "1234567k",  in_blacklist:false,
                  name: "Ana", last_name: "Polo", image: "",
                  short_bio: "I live in Miami and love justice.", location:"Chile")

u2 = User.create( username: "user2", email: "user2@gmail.com", password: "winter123",  in_blacklist:false,
                  name: "Sam", last_name: "Smith", image: "",
                  short_bio: "Hello everyone, i love singing!", location: "Argentina")

u3 = User.create(username: "user3", email: "user3@gmail.com", password: "summer78", in_blacklist:false,
                 name: "Pepito", last_name: "Torres", image: "",
                 short_bio: "I don't sing to be famous.",location: "Arica y Parinacota")

u4 = User.create(username: "user4", email: "user4@gmail.com", password: "black560", in_blacklist:true,
                 name: "Pepita", last_name: "Sol", image: "",
                 short_bio: "Hi!", location: "Región Norte - Acre")
u5 = User.create( username: "user5", email: "user5@gmail.com", password: "autumn5632", in_blacklist:false,
                  name: "Rick", last_name: "Sánchez",image: "",
                  short_bio: "Hello everyone!!",location: "Biobío")
u6 = User.create(username: "user6", email: "user6@gmail.com", password: "jaja12345", in_blacklist:false,
                 name: "Elmer", last_name: "Figueroa", image: "",
                 short_bio: "Hello everyone, a dance?",location: "Buenos Aires" )


m1 = Member.create(user: u1, organization: o1, is_admin_org:true)
m2 = Member.create(user: u2, organization: o1, is_admin_org:false)
m3 = Member.create(user: u3, organization: o2, is_admin_org:false)
m4 = Member.create(user: u4, organization: o2, is_admin_org:true)

l1 = Location.create(country: "Chile", region: "Metropolitana")
l2 = Location.create(country: "Argentina", region: "Buenos Aires")
l3 = Location.create(country: "Brasil", region: "Región Norte - Acre")
l4 = Location.create(country: "Chile", region: "Arica y Parinacota")
l5 = Location.create(country: "Chile", region: "Atacama")
l6 = Location.create(country: "Chile", region: "Biobío")




msm1 = Message.create(user_receiver: u1, user_transmitter: u2, text_message: "hi1")
msm2 = Message.create(user_receiver: u2, user_transmitter: u3, text_message: "hi2")
msm3 = Message.create(user_receiver: u3, user_transmitter: u4, text_message: "hi3")
msm4 = Message.create(user_receiver: u4, user_transmitter: u1, text_message: "hi4")

e1 = Event.create(user: u1, title: "Winter is coming", description: "The winter is the better weather of the year so welcome to gala 2020!!", private: false, organization: o1,
                 image: "", location: "Las Vegas")
e2 = Event.create(user: u2, title: "Party Somewhere", description: "Cool party", private: true, organization: o2,
                  image: "", location:"London")
e3 = Event.create(user: u3, title: "Welcome to the jungle", description: "Hello everyone gala 2020", private: false, organization: o1,
                  image:"", location:"Park, New York")
e4 = Event.create(user: u1, title: "Less is more", description: "Hello everyone 30th birthday celebration", private: true, organization: o2,
                  image: "", location:"Santiago")
e5 = Event.create(user: u6, title: "The Sky", description: "Hello everyone 30th birthday celebration", private: true, organization: o1,
                  image: "", location:"Coquimbo")

e6 = Event.create(user: u5, title: "One more year", description: "Hello everyone 60th birthday celebration", private: false, organization: o2,
                  image: "", location:"Arica")
e7 = Event.create(user: u5, title: "Stars", description: "Hello everyone 45th birthday celebration", private: false, organization: o2,
                  image: "", location:"Las Vegas")

h1 = Homepage.create(organization: o1, event:e1)

g1 = Guest.create(user: u1, event: e1)
g2 = Guest.create(user: u2, event: e2)
g3 = Guest.create(user: u3, event: e3)
g4 = Guest.create(user: u1, event: e3)
g5 = Guest.create(user: u2, event: e4)
g6 = Guest.create(user: u1, event: e7)

dtv1 = DatesToVote.create(event: e1, date: DateTime.parse("2020-04-02 19:00:00 UTC-4"))
dtv2 = DatesToVote.create(event: e2, date: DateTime.parse("2020-04-07 19:00:00 UTC-4"))
dtv3 = DatesToVote.create(event: e3, date: DateTime.parse("2020-04-14 19:00:00 UTC-4"))
dtv4 = DatesToVote.create(event: e4, date: DateTime.parse("2020-04-17 19:00:00 UTC-4"))
dtv4 = DatesToVote.create(event: e7, date: DateTime.parse("2020-04-17 19:00:00 UTC-4"))

v1 = Vote.create(dates_to_vote: dtv1,user: u1)
v2 = Vote.create(dates_to_vote: dtv2,user: u2)
v3 = Vote.create(dates_to_vote: dtv3,user: u3)
v4 = Vote.create(dates_to_vote: dtv4,user: u1)

r1 = Report.create(user: u1, event: e1)


c1 = Comment.create(user: u1, event: e1, rich_text: "hello world")
c2 = Comment.create(user: u2, event: e2, rich_text: "hello friends")
c3 = Comment.create(user: u3, event: e3, rich_text: "hello mom")
c4 = Comment.create(user: u4,event: e4, rich_text: "hello dude")
c5 = Comment.create(user: u1,event: e7, rich_text: "hello friends")


# replies to comment
rp1 = RepliesToComment.create(comment_receiver: c4, comment_transmitter: c1)
