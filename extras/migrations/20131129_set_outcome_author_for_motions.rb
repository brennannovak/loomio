class SetOutcomeAuthorForMotionsMigration
  def self.now
    Motion.reset_column_information
    spoofed = 0
    actual = 0

    Motion.where('closed_at IS NOT NULL').find_each do |motion|
      puts motion.id if (motion.id % 100) == 0

      if motion.outcome.present?
        outcome_event = motion.events.where(kind: 'motion_outcome_created').last
        if outcome_event.blank?
          motion.update_attribute(:outcome_author_id, motion.author.id)
          spoofed +=1
        else
          motion.update_attribute(:outcome_author_id, outcome_event.user.id)
          actual += 1
        end
      end
    end
    puts '//////////////////////////////////////////////////////////'
    puts 'UPGRADE DONE'
    puts "#{Motion.where('closed_at IS NOT NULL').count} targeted motions:"
    puts "\t- #{actual} with accurate author"
    puts "\t- #{spoofed} with best guess"
    puts '//////////////////////////////////////////////////////////'
  end
end
