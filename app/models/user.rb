class User < ActiveRecord::Base
	has_secure_password
	has_many :glossaries
	has_many :entries, through: :glossaries
end
