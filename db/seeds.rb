puts "🌱 Seeding spices..."

# Seed your database here

    Meme.create([
  { name: 'Distracted Boyfriend', 
    image_url: 'https://i.imgflip.com/1ur9b0.jpg', 
    user_id: 1},
    
  { name: 'Ancient Aliens', 
    image_url: 'https://i.imgflip.com/1bgw.jpg', 
   user_id: 1},

  { name: 'Two Buttons', 
    image_url: 'https://i.imgflip.com/1g8my4.jpg', 
    user_id: 1},

  { name: 'Futurama Fry', 
    image_url: 'https://i.imgflip.com/1bgw.jpg', 
    user_id: 1},
])
puts "✅ Done seeding!"
