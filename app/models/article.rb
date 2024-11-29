class Article < ApplicationRecord
    has_many :comments
    # validates :title, presence: true
    # validates :body, presence: true, length: { minimum: 10 }
    
    # validates_each :title, :body do |record, attr, value|
    #     record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
    # end

    validate :title_must_start_with_uppercase

    private

    # this is the custom validation i am creating 
    def title_must_start_with_uppercase
        return if title.blank? # Avoid running validation on nil or blank title
        
        unless title.match?(/\A[A-Z]/)
            errors.add(:title, "must start with an uppercase letter")
        end
    end
end