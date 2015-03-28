# Create the admin user
User.create!(
    email: 'linlin_19930805@yahoo.com',
    password: '12345678',
    password_confirmation: '12345678',
    admin: true
)

# Create 20 regular users
20.times do
  email = Faker::Internet.email
  password = '12345678'

  User.create!(
      email: email,
      password: password,
      password_confirmation: password
  )
end

# Create three categories
3.times do |i|
  Category.create!(name: "Category ##{i + 1}")
end

# Create 25 products in each of the 3 categories
3.times do |c| # Iterate through 3 categories
  25.times do
    title = "#{Faker::Commerce.product_name} #{['Original', 'Replica', 'Mint', 'Limited Edition', 'Mini', 'Plus'].shuffle[0]} ##{SecureRandom.urlsafe_base64(1).gsub('-', '').gsub('_', '')[0]}"
    Category.find(c+1).products.create!(title: title, description: Faker::Lorem.sentences(30).join(' '), image_url: "SP#{[1,2,3].shuffle[1]}.jpg", price: Faker::Commerce.price)
  end
end
