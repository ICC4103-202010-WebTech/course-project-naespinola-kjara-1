# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

o1 = Organization.create(name: "Snow", image:"https://www.audiovisualstudio.es/wp-content/uploads/2017/08/LED.jpg",
                         rich_text: " ", description: "Hello members", video: "", document: "" )
o2 = Organization.create(name: "Autumn fall", image:"https://services.meteored.com/img/article/se-acerca-el-otono-astronomico-208381-2_768.jpg",
                         rich_text: " ", description: "Hello members, welcome everyone!!", video: "", document: "" )

u1 = User.create(organization:o1, username: "user1", email: "user1@gmail.com", password: "1234567k", is_organization_admin: false, is_system_admin: true, in_blacklist:false)
u2 = User.create(organization:o1, username: "user2", email: "user2@gmail.com", password: "winter123", is_organization_admin: true, is_system_admin: false, in_blacklist:false)

u3 = User.create(organization: o1, username: "user3", email: "user3@gmail.com", password: "summer78", is_organization_admin: false, is_system_admin: false, in_blacklist:false)
u4 = User.create(organization: o1, username: "user4", email: "user4@gmail.com", password: "black560", is_organization_admin: false, is_system_admin: false, in_blacklist:true)
u5 = User.create(organization: o2, username: "user5", email: "user5@gmail.com", password: "autumn5632", is_organization_admin: false, is_system_admin: false, in_blacklist:false)
u6 = User.create(organization: o2, username: "user6", email: "user6@gmail.com", password: "jaja12345", is_organization_admin: true, is_system_admin: true, in_blacklist:false)

l1 = Location.create(country: "Chile", region: "Metropolitana")
l2 = Location.create(country: "Argentina", region: "Buenos Aires")
l3 = Location.create(country: "Brasil", region: "Región Norte - Acre")
l4 = Location.create(country: "Chile", region: "Arica y Parinacota")
l5 = Location.create(country: "Chile", region: "Atacama")
l6 = Location.create(country: "Chile", region: "Biobío")

p1 = Profile.create(user: u1, location: l1, image: "https://media.metrolatam.com/2019/06/12/draanamariapolop-a77ad0bb58934792a160341b6f38e310-1200x800.jpg",
                    document: "",video: "", short_bio: "I live in Miami and love justice.", name: "Ana", last_name: "Polo")
p2 = Profile.create(user: u2, location: l2,  image: "https://www.rockandpop.cl/wp-content/uploads/2020/04/sam_smith_por_covid19_cambia_el_nombre_de_su_album_y_pospone_su_estreno.jpg_1902800913-1024x768.jpg",
                    document: "" ,video: "", short_bio: "Hello everyone, i love singing!", name: "Sam", last_name: "Smith")
p3 = Profile.create(user: u3, location: l3,  image: "https://diariocorreo.pe/resizer/CUEoZ5t8eAY7O-4GClnbXe_OYf0=/980x528/smart/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/4XZ2TFCMLJFIBBGZJXSN6DODLA.jpg",
                    document: "",video: "", short_bio: "I don't sing to be famous.", name: "Pepito", last_name: "Torres")
p4 = Profile.create(user: u4, location: l4, image: "https://media.metrolatam.com/2018/08/23/mujer1-234853dc0e0619b7be7317871413304c-1200x600.jpg",
                    document: "",video: "", short_bio: "Hi!", name: "Pepita", last_name: "Sol")
p5 = Profile.create(user: u5, location: l5, image: "https://i.pinimg.com/originals/82/db/f2/82dbf2759fe8ebea414e3e83b894dc2c.jpg",
                    document: "",video: "", short_bio: "Hello everyone!!", name: "Rick", last_name: "Sánchez")
p6 = Profile.create(user: u6, location: l6, image: "https://los40.cl/wp-content/uploads/2020/03/chayanne.jpg",
                    document: "",video: "", short_bio: "Hello everyone, a dance?", name: "Elmer", last_name: "Figueroa")
m1 = Mailbox.create(user: u1)
m2 = Mailbox.create(user: u2)
m3 = Mailbox.create(user: u3)
m4 = Mailbox.create(user: u4)
m5 = Mailbox.create(user: u5)

msm1 = Message.create(user_receiver: u1, user_transmitter: u2, text_message: "hi1")
msm2 = Message.create(user_receiver: u2, user_transmitter: u3, text_message: "hi2")
msm3 = Message.create(user_receiver: u3, user_transmitter: u4, text_message: "hi3")
msm4 = Message.create(user_receiver: u4, user_transmitter: u1, text_message: "hi4")

mr1 = MessageReceived.create(mailbox: m1, message: msm1)
mr2 = MessageReceived.create(mailbox: m2, message: msm2)
mr3 = MessageReceived.create(mailbox: m3, message: msm3)
mr4 = MessageReceived.create(mailbox: m4, message: msm4)

ms1 = MessageSent.create(mailbox: m1, message: msm4)
ms2 = MessageSent.create(mailbox: m2, message: msm1)
ms3 = MessageSent.create(mailbox: m3, message: msm2)
ms4 = MessageSent.create(mailbox: m4, message: msm3)

e1 = Event.create(user: u1, title: "Event1", description: "Hello everyone 40th birthday celebration", private: false, include_organization: true,
                  image: "https://fonzievents.com/wp-content/uploads/2016/09/02-1.jpg", videos: "", documents: "", location: "Las Vegas" )
e2 = Event.create(user: u2, title: "Event2", description: "Hello everyone 35th birthday celebration", private: true, include_organization: true,
                  image: "https://www.marquid.com/wp-content/uploads/2017/06/6197706_orig.jpg", videos: "", documents: "", location:"London")
e3 = Event.create(user: u3, title: "Event3", description: "Hello everyone gala 2020", private: false, include_organization: false,
                  image:"https://www.networkworld.es/archivos/201810/concert-2527495-960-720.jpg", videos: "", documents: "", location:"Park, New York")
e4 = Event.create(user: u1, title: "Event4", description: "Hello everyone 30th birthday celebration", private: true, include_organization: false,
                  image: "https://cdn0.matrimonios.cl/emp/fotos/3/8/0/5/t30_2x_whatsapp-image-2019-11-08-at-4-08-46-pm_8_143805-157350251244349.jpeg", videos: "", documents: "", location:"Santiago")
e5 = Event.create(user: u6, title: "Event5", description: "Hello everyone 30th birthday celebration", private: true, include_organization: true ,
                  image: "https://static.tumblr.com/745109f3b8e935808d5b9ca2b80b058a/2peleeu/zbvod4s1v/tumblr_static_tumblr_static_86z1yiduyaw4co8wggw8kooog_640.jpg",
                  videos: "", documents: "", location:"Coquimbo")

e5 = Event.create(user: u5, title: "Event6", description: "Hello everyone 60th birthday celebration", private: false, include_organization: true ,
                  image: "https://i.pinimg.com/originals/ac/db/90/acdb90265c02bf9c04b92b4beaa1f293.jpg",
                  videos: "", documents: "", location:"Antofagasta")

h1 = Homepage.create(organization: o1, event:e1)

g1 = Guest.create(user: u1, event: e1)
g2 = Guest.create(user: u2, event: e2)
g3 = Guest.create(user: u3, event: e3)
g4 = Guest.create(user: u4, event: e1)
g5 = Guest.create(user: u1, event: e4)

dtv1 = DatesToVote.create(event: e1, date: DateTime.parse("2020-04-02 19:00:00 UTC-4"))
dtv2 = DatesToVote.create(event: e2, date: DateTime.parse("2020-04-07 19:00:00 UTC-4"))
dtv3 = DatesToVote.create(event: e3, date: DateTime.parse("2020-04-14 19:00:00 UTC-4"))
dtv4 = DatesToVote.create(event: e4, date: DateTime.parse("2020-04-17 19:00:00 UTC-4"))

v1 = Vote.create(guest: g1, dates_to_vote: dtv1)
v2 = Vote.create(guest: g2, dates_to_vote: dtv2)
v3 = Vote.create(guest: g3, dates_to_vote: dtv3)
v4 = Vote.create(guest: g5, dates_to_vote: dtv4)

r1 = Report.create(user: u1, event: e1)

wall1 = WallOfComment.create(event: e1)
wall2 = WallOfComment.create(event: e2)
wall3 = WallOfComment.create(event: e3)
wall4 = WallOfComment.create(event: e4)

c1 = Comment.create(user: u1, wall_of_comment: wall1, rich_text: "hello world")
c2 = Comment.create(user: u2, wall_of_comment: wall2, rich_text: "hello friends")
c3 = Comment.create(user: u3, wall_of_comment: wall3, rich_text: "hello mom")
c4 = Comment.create(user: u4, wall_of_comment: wall1, rich_text: "hello dude")



# replies to comment
rp1 = RepliesToComment.create(comment_receiver: c4, comment_transmitter: c1)
