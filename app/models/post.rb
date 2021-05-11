class Post < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :user
  has_many :comments, as: :commentable
  has_rich_text :body

  validates :title, presence: true

  after_create_commit -> {
    # broadcast_append_later_to # as a BackgroundJob
    broadcast_append_to self, target: "all-posts", partial: "posts/post"
  }


  # Use this method to send Notification
  after_create :send_notifications

  def send_notifications
    users = user_mentions
    users.each do |user|
      # PostMailer.user_mention(self, user).deliver_now
      puts "\n\n\n\n"
      puts "Sending Notification to #{user.username}..."
      puts "\n\n\n\n"
    end
  end

  def user_mentions
    @users ||= body.body.attachments.select{ |a| a.attachable.class == User }.map(&:attachable).uniq
  end
end
