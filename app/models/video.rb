class Video < ActiveRecord::Base


  # Paperclip

  # http://www.thoughtbot.com/projects/paperclip
  has_attached_file :video,

    :storage => :s3,

    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",

    :path => ":attachment/:id/:style/:basename.:extension",

    :bucket => 'yourbucketname'


  # Paperclip Validations

  validates_attachment_presence :video

  validates_attachment_content_type :video, :content_type => ['application/x-shockwave-flash', 'application/x-shockwave-flash', 'application/flv', 'video/x-flv']

end