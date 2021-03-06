class Pin < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, 
            :styles => { :medium => "300x300>", :thumb => "100x100>" },
            :storage => :s3,
            :bucket  => ENV['S3_BUCKET_NAME'],
            :s3_credentials => {
                    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                },
                :s3_permissions => 'private'
	validates :image, presence: true
	validates :description, presence: true
end
