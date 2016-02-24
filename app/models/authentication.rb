class Authentication
	include Mongoid::Document
	include Mongoid::Attributes::Dynamic

	before_save :encrypt_password

	field :email, type: String
	field :encrypted_password, type: String
	field :salt, type: String

	has_many :container

	def encrypt_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
		end
		self.password = nil
	end
end
