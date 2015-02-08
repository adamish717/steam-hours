module EntriesHelper
  include ActionView::Helpers::DateHelper

  def hours duration
    distance_of_time_in_words(duration).gsub('about ','')
  end
end
