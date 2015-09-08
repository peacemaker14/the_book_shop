Product.create!(title: "The Great Gatsby",
                author: "Scott F Fitzgerald",
                description: "Overated",
                image_url: "https://upload.wikimedia.org/wikipedia/en/b/b0/Gatsby_1925_jacket.gif",
                price: 55000)

Product.create!(title: "Mata yang Enak Dipandang",
                author: "Ahmad Tohari",
                description: "Buku ini merupakan kumpulan lima belas cerita pendek Ahmad Tohari yang tersebar di sejumlah media cetak antara tahun 1983 dan 1997.
Seperti novel-novelnya, cerita-cerita pendeknya pun memiliki ciri khas. Ia selalu mengangkat kehidupan orang-orang kecil atau kalangan bawah dengan segala lika-likunya.
Ahmad Tohari sangat mengenal kehidupan mereka dengan baik. Oleh karena itu, ia dapat melukiskannya dengan simpati dan empati sehingga kisah-kisah itu memperkaya batin pembaca.",
                image_url: "http://d.gr-assets.com/books/1384913224l/18867903.jpg",
                price: 40000)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,)
