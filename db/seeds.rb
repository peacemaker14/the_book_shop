Product.create!(title: "Makan Angin",
                author: "Jan Moreno",
                description: "Good book, indeed",
                image_url: "https://upload.wikimedia.org/wikipedia/en/b/b0/Gatsby_1925_jacket.gif",
                price: 5000)

Product.create!(title: "Memang Jancuk",
                author: "Sujiwa Teja",
                description: "Ga tau dah ya",
                image_url: "http://4.bp.blogspot.com/-_IRu1AW8TUo/UTlhh9X3cnI/AAAAAAAAAzQ/LgxwRIxC2MA/s1600/Susilo-Bambang-Yudhoyono.jpg",
                price: 500)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,)
