user = User.new(name: "Example User",
                email: "user@example.org",
                password: "password",
                password_confirmation: "password",
                role: 2)
user.skip_confirmation!
user.save!