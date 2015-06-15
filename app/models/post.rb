class Post < ActiveRecord::Base
has_attached_file :media,  :s3_protocol => :https, :default_url => "/images/beeshup.jpg"
belongs_to :user
end
