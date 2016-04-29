class Travel < ActiveRecord::Base
  has_many :videos, dependent: :destroy
  before_save :make_subject
  PREPS = %w(in for on at)

  default_scope -> { order("id asc") }

  scope :search, -> (subject=nil) do
    if subject.present?
      subject =~ /(^.*)(in|for|on|at)(.*)/
      todo = $1.strip if $1
      place = $3.strip if $3
      if todo.present? and place.present?
        where('place iLIKE ? and todo iLIKE ?', place, todo)
      else
        where('subject iLIKE ?', "%#{subject}%")
      end
    else
      none
    end
  end

  def self.parse_subject(subject)
    unless travel = self.find_by(subject: subject)
      subject =~ /(^.*)(in|for|on|at)(.*)/
      travel = self.new(todo: $1.strip, preposition: $2, place: $3.strip)
      travel.save
    end

    travel
  end

  def make_subject
    self.subject = "#{self.todo} #{self.preposition} #{self.place}"
  end
end
