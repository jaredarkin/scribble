# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Comment.destroy_all
User.destroy_all
Post.destroy_all

bob = User.create!(username: "billybob", password_digest: "#{User.digest('bob')}", name: "Bob Smith", photo_url: "http://www.fillmurray.com/200/200", location: "Washington", role: 0)
sally = User.create!(username: "sally420", password_digest: "#{User.digest('sally')}", name: "Sally Ride", photo_url: "http://www.fillmurray.com/200/200", location: "London", role: 0)
joe = User.create!(username: "joe schmo", password_digest: "#{User.digest('joe')}", name: "Joe Miller", photo_url: "http://www.fillmurray.com/200/200", location: "Richmond", role: 1)
jared = User.create!(username: "jared", password_digest: "#{User.digest('jared')}", name: "Jared Arkin", photo_url: "http://www.fillmurray.com/200/200", location: "Richmond", role: 2)

pbj = Post.create(title: "Peanut Butter Jelly Time", photo_url: "http://i.huffpost.com/gen/1136284/images/o-GARDENING-TOOL-facebook.jpg", user: jared, body: "Bresaola rump ball tip, pancetta pork brisket capicola landjaeger kevin chicken tongue pork chop spare ribs tenderloin ham. Venison ham hock short ribs pastrami turkey hamburger ground round. Frankfurter capicola swine doner. Chicken kevin cupim bacon leberkas ham, doner jowl rump shank.")
bluth = Post.create(title: "Illusions, Michael", photo_url: "http://www.vancouversun.com/cms/binary/6566035.jpg", user: jared, body: "He's a regular Freddie Wilson, that one. We need a name. Maybe 'Operation Hot Mother'. How about a turtle? I've always loved those leathery little snappy faces. That coat costs more than your house! Ann certainly has a great deal of Mass. I'll sacrifice anything for my children. I will pack your sweet pink mouth with so much ice cream you'll be the envy of every Jerry and Jane on the block!")
rick = Post.create(title: "A Rick in Time", photo_url: "http://www.professionalpt.com/wp-content/uploads/2015/05/gardening-331986_640.jpg", user: joe, body: "Well we're movin' on up to the east side to a deluxe apartment in the sky. Come and knock on our door. We've been waiting for you. Where the kisses are hers and hers and his. Three's company too. Fleeing from the Cylon tyranny the last Battlestar – Galactica - leads a rag-tag fugitive fleet on a lonely quest - a shining planet known as Earth.")
thrones = Post.create(title: "HardHome", photo_url: "http://aabga.org/wp-content/uploads/2015/07/Garden-11.jpg", user: joe, body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauri.")


# pbj.comments.create(body: "I love Bacon", user: sally)
bluth.comments.create(body: "I think I'm touching something hot!", user: bob)
bluth.comments.create(body: "Her??", user: joe)
rick.comments.create(body: "Jerry is a putz", user: joe)
thrones.comments.create(body: "you know nothing jon snow", user: joe)
thrones.comments.create(body: "spoiler alert!", user: sally)
