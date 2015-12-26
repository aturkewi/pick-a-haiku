namespace :likes do
  desc "TODO"
  task convert_likes: :environment do
    Haiku.all.each do |haiku|
      haiku.likes.times do
        Like.create(user_id:2, haiku_id:haiku.id)
      end
    end
  end

end
