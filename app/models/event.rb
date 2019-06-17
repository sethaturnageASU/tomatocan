class Event < ApplicationRecord
#  has_event_calendar
#  belongs_to :user
  has_many :rsvpqs
  has_many :users, :through => :rsvpqs
  validates :usrid, presence: true
  validates :name, presence: true
  validates :start_at, presence: true
  validates :name, format: { without: /http|\.co|\.com|\.org|\.net|\.tv|\.uk|\.ly|\.me|\.biz|\.mobi|\.cn|kickstarter|barnesandnoble|smashwords|itunes|amazon|eventbrite|rsvpify|evite|meetup/i, message: "s 
    ...URLs are not allowed in event titles. Keep in mind that people will be searching here for actual gatherings 
    that they can attend, or to find out when you'll be livestreaming. They will not be searching for sites to 
    browse." }
  validates :desc, format: { without: /http|\.co|\.com|\.org|\.net|\.tv|\.uk|\.ly|\.me|\.biz|\.mobi|\.cn|kickstarter|barnesandnoble|smashwords|itunes|amazon|eventbrite|rsvpify|evite|meetup/i, message: "riptions 
    ...URLs are not allowed in event descriptions. Keep in mind that people will be searching here for actual 
    gatherings that they can attend, or to find out when you'll be livestreaming. They will not be searching for 
    sites to browse. Paste all information attendees need here." }
  validates :address, format: { without: /http|\.co|\.com|\.org|\.net|\.tv|\.uk|\.ly|\.me|\.biz|\.mobi|\.cn|kickstarter|barnesandnoble|smashwords|itunes|amazon|eventbrite|rsvpify|evite|meetup/i, message: " 
    ...URLs are not allowed in addresses. Events are searchable only by street address & zip code. If you will be 
    livestreaming this event from www.CrowdPublish.TV/yourpage/stream, leave the address as the default: livestream " }

  time = Proc.new { |r| r.start_at.to_f + 3.hours.to_f }

  validate :endat_greaterthan_startat 
  def endat_greaterthan_startat
    if end_at.present? && end_at < start_at
      errors.add(:end_at, "End time must be after start time")
    end
  end  

 

#  validates_numericality_of :end_at, less_than: ->(t) { t.start_at + 3.hours }, :allow_blank => true, message: " date can't be more than 3 hours after Event start time"

#  geocoded_by :address
#  after_validation :geocode, :if => :address_changed? # don't do this until geocoder gem improves

end
