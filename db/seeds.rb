admin = User.new(name: "Example Admin",
                email: "admin@example.org",
                password: "password",
                password_confirmation: "password",
                role: 2)
admin.skip_confirmation!
admin.save!

user = User.new(name: "Example User",
                email: "user@example.org",
                password: "password",
                password_confirmation: "password",
                role: 1)
user.skip_confirmation!
user.save!